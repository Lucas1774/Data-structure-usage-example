package es.uned.lsi.eped.pract2020_2021;


import es.uned.lsi.eped.DataStructures.BSTree;
import es.uned.lsi.eped.DataStructures.BSTreeIF.IteratorModes;
import es.uned.lsi.eped.DataStructures.Collection;
import es.uned.lsi.eped.DataStructures.IteratorIF;

/*Representa una cola con prioridad implementada mediante un árbol binario de búsqueda de SamePriorityQueue*/
public class BSTPriorityQueue<E> extends Collection<E> implements PriorityQueueIF<E> {
 
	private BSTree <SamePriorityQueue<E>> bstree;

  /* Clase privada que implementa un iterador para la *
   * cola con prioridad basada en secuencia.          */
  public class PriorityQueueIterator implements IteratorIF<E> {
	  private IteratorIF <E> samepriorityqueueiterator;
	  private IteratorIF <SamePriorityQueue<E>> treeiterator;

    /*Constructor por defecto*/
    protected PriorityQueueIterator(){ 
    	this.treeiterator= bstree.iterator(IteratorModes.REVERSEORDER);
    	if (!bstree.isEmpty()) {
    		this.samepriorityqueueiterator= treeiterator.getNext().iterator();
    	}
    }

    /*Devuelve el siguiente elemento de la iteración*/
    public E getNext() { 
    	if (samepriorityqueueiterator.hasNext()) {
    		return this.samepriorityqueueiterator.getNext();
    	} else {
    			samepriorityqueueiterator= treeiterator.getNext().iterator();
    			return this.samepriorityqueueiterator.getNext();
    	}
    }
    
    /*Comprueba si queda algún elemento por iterar*/
    public boolean hasNext() { 
    	boolean hasnext = false;
    	if (!bstree.isEmpty()) {
	    	if( this.samepriorityqueueiterator.hasNext()) {
	    		hasnext=true;
	    	} else if( this.treeiterator.hasNext()){
	    		hasnext= true;
	    	}
    	}
    	return hasnext;
    }
 
    /*Reinicia el iterador a la posición inicial*/
    public void reset() { 
    	this.treeiterator= bstree.iterator(IteratorModes.REVERSEORDER);
    	if (!bstree.isEmpty()) {
    		this.samepriorityqueueiterator= treeiterator.getNext().iterator();
    	}
    }
  }



  /* OPERACIONES PROPIAS DE ESTA CLASE */

  /*constructor por defecto: crea cola con prioridad vacía
   */
  BSTPriorityQueue(){
	  this.bstree = new BSTree <SamePriorityQueue<E>>();
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
	  boolean existsofsamepriority = false;
	  IteratorIF <SamePriorityQueue<E>> treeiterator = this.bstree.iterator(IteratorModes.REVERSEORDER);
	  SamePriorityQueue <E> aux;
	  while (treeiterator.hasNext()) {
		  aux= treeiterator.getNext();
		  if (aux.getPriority() == prior) {
			  existsofsamepriority = true;
			  aux.enqueue(elem);
			  this.size++;
			  break;
		  }
		  if (aux.getPriority() < prior) {
			  break;
		  }
	  }
	  if(!existsofsamepriority) {
		  SamePriorityQueue<E> mynewqueue = new SamePriorityQueue<E>(prior);
		  mynewqueue.enqueue(elem);
		  this.bstree.add(mynewqueue);
		  this.size++;
	  }
  }

  /*Elimina el elemento más prioritario y que llegó a la cola
   *en primer lugar
   * @Pre !isEmpty()
   */
  public void dequeue() { 
	  IteratorIF <SamePriorityQueue<E>> treeiterator = this.bstree.iterator(IteratorModes.REVERSEORDER);
	  SamePriorityQueue <E> aux = treeiterator.getNext();
	  aux.dequeue();
	  this.size--;
	  if (aux.isEmpty()) {
		  this.bstree.remove(aux);
	  }
}

  /* OPERACIONES PROPIAS DE LA INTERFAZ SEQUENCEIF */

  /*Devuelve un iterador para la cola*/
  public IteratorIF<E> iterator() { 
	  return new PriorityQueueIterator();
  }
 
  /* OPERACIONES PROPIAS DE LA INTERFAZ COLLECTIONIF */

  /*Devuelve el número de elementos de la cola*/
  public int size() { 
	  return this.size;
  }

  /*Decide si la cola está vacía*/
  public boolean isEmpty() { 
	  return this.size()==0;
  }
 
  /*Decide si la cola contiene el elemento dado por parámetro*/
  public boolean contains(E e) { 
	  boolean contains = false;
	  PriorityQueueIterator iterator = new PriorityQueueIterator();
	  while (iterator.hasNext()) {
		  if (iterator.getNext().equals(e)){
			  contains = true;
			  break;
		  }
	  }
	  return contains;
  }
 
  /*Elimina todos los elementos de la cola*/
  public void clear() { 
	  this.bstree.clear();
	  this.size=0;
  }
 
}

