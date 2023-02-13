package es.uned.lsi.eped.pract2020_2021;

import es.uned.lsi.eped.DataStructures.*;

/*Representa una cola con prioridad implementada mediante una secuencia de SamePriorityQueue*/
public class BucketQueue<E> extends Collection<E> implements PriorityQueueIF<E> {
	private List <SamePriorityQueue<E>> list;

  /* Clase privada que implementa un iterador para la *
   * cola con prioridad basada en secuencia.          */
  public class PriorityQueueIterator implements IteratorIF<E> {
	  private IteratorIF <E> samepriorityqueueiterator;
	  private IteratorIF <SamePriorityQueue<E>> listiterator;

    /*Constructor por defecto*/
    protected PriorityQueueIterator(){ 
    	this.listiterator= list.iterator();
    	this.samepriorityqueueiterator= listiterator.getNext().iterator();
    }

    /*Devuelve el siguiente elemento de la iteración*/
    public E getNext() { 
    	if (samepriorityqueueiterator.hasNext()) {
    		return this.samepriorityqueueiterator.getNext();
    	} else {
    			samepriorityqueueiterator= listiterator.getNext().iterator();
    			return this.samepriorityqueueiterator.getNext();
    	}
    }
    
    /*Comprueba si queda algún elemento por iterar*/
    public boolean hasNext() { 
    	boolean hasnext = false;
    	if( this.samepriorityqueueiterator.hasNext()) {
    		hasnext=true;
    	} else if( this.listiterator.hasNext()){
    		hasnext= true;
    	}
    	return hasnext;
    }
 
    /*Reinicia el iterador a la posición inicial*/
    public void reset() { 
    	this.listiterator= list.iterator();
    	this.samepriorityqueueiterator= listiterator.getNext().iterator();
    }
  }
  /* OPERACIONES PROPIAS DE ESTA CLASE */

  /*constructor por defecto: crea cola con prioridad vacía
   */
  BucketQueue(){ 
	  list = new List<SamePriorityQueue<E>>();
  }

  /* OPERACIONES PROPIAS DE LA INTERFAZ PRIORITYQUEUEIF */

  /*Devuelve el elemento más prioritario de la cola y que
   *llegó en primer lugar
   * @Pre !isEmpty()
   */
  public E getFirst() {
		 return this.iterator().getNext();
  }
 
  /*Añade un elemento a la cola de acuerdo a su prioridad
   *y su orden de llegada
   */
  public void enqueue(E elem, int prior) {
	  boolean isdone = false;
	  IteratorIF <SamePriorityQueue<E>> listiterator = this.list.iterator();
	  SamePriorityQueue <E> aux;
	  while (listiterator.hasNext()) {
		  aux= listiterator.getNext();
		  if (aux.getPriority() == prior) {
			  aux.enqueue(elem);
			  this.size++;
			  isdone = true;
			  break;
		  }
		  if (aux.getPriority() < prior) {
			  break;
		  }
	  }
	  if(!isdone) {
		  SamePriorityQueue<E> mynewqueue = new SamePriorityQueue<E>(prior);
		  mynewqueue.enqueue(elem);
		  if(this.list.isEmpty()) {
			  this.list.insert(1, mynewqueue);
			  this.size++;
			  isdone = true;
		  }
		  if (!isdone) {
			  listiterator.reset();
			  int i= 1;
			  while (listiterator.hasNext()) {
				  aux= listiterator.getNext();
				  if (prior>aux.getPriority()) {
					  this.list.insert(i, mynewqueue);
					  this.size++;
					  isdone = true;
					  break;
				  }
				  i++;
			  }
			  if (!isdone) {
				  this.list.insert(this.list.size()+1, mynewqueue);
				  isdone= true;
				  this.size++;
			  }
		  }
	  }
  }

  /*Elimina el elemento más prioritario y que llegó a la cola
   *en primer lugar
   * @Pre !isEmpty()
   */
  public void dequeue() {
	  this.list.get(1).dequeue();
	  this.size--;
	  if (this.list.get(1).isEmpty()) {
		  this.list.remove(1);
	  }
  }

  /* OPERACIONES PROPIAS DE LA INTERFAZ SEQUENCEIF */

  /*Devuelve un iterador para la cola*/
  public IteratorIF<E> iterator() { 
	  return new PriorityQueueIterator();
  }
 
  /* OPERACIONES PROPIAS DE LA INTERFAZ COLLECTIONIF */

  /*Devuelve el número de elementos de la cola*/
  public int size() {;
  	return this.size;
  }

  /*Decide si la cola está vacía*/
  public boolean isEmpty() { 
	  return this.size()==0;
  }
 
  /*Decide si la cola contiene el elemento dado por parámetro*/
  public boolean contains(E e) {
	  PriorityQueueIterator iterator = new PriorityQueueIterator();
	  boolean contains= false;
	  while(iterator.hasNext()) {
		  if (iterator.getNext().equals(e)) {
			  contains=true;
			  break;
		  }
	  }
	  return contains;
  }
  	  
 
  /*Elimina todos los elementos de la cola*/
  public void clear() { 
	  this.list.clear();
	  this.size=0;
  }
}

