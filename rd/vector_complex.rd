=begin
= GSL::Vector::Complex

== Class methods
--- GSL::Vector::Complex.alloc(size)
--- GSL::Vector::Complex.alloc(re, im)
--- GSL::Vector::Complex.alloc(z0, z1, z2, ...)
--- GSL::Vector::Complex.alloc()
--- GSL::Vector::Complex[...]
    Constructors.

    (1) With two (real) vectors:
          irb(main):006:0> re = Vector[0..3]
          irb(main):007:0> im = Vector[5..8]
          irb(main):008:0> z = Vector::Complex[re, im]
          [ [0.000e+00 5.000e+00] [1.000e+00 6.000e+00] [2.000e+00 7.000e+00] [3.000e+00 8.000e+00] ]

    (2) With arrays
          irb(main):009:0> z = Vector::Complex.alloc([0, 1], [2, 5], [-3, 4])
          [ [0.000e+00 1.000e+00] [2.000e+00 5.000e+00] [-3.000e+00 4.000e+00] ]

--- GSL::Vector::Complex.calloc(n)
    Creates a complex vector of length ((|n|)) and initializes all 
    the elements of the vector to zero.

== Instance methods
=== Accessing vector elements
--- GSL::Vector::Complex#get(args)
--- GSL::Vector::Complex#[args]
    Returns elements(s) of the complex vector ((|self|)) if ((|args|)) is a
    single Fixnum, a single Array of Fixnums, or a single GSL::Permutation (or
    GSL::Index).  For all other ((|args|)), the parameters are treated as
    with (({Vector#subvector})) and a (({Vector::View})) is returned.

    Example:
      irb(main):010:0> z
      [ [0.000e+00 1.000e+00] [2.000e+00 5.000e+00] [-3.000e+00 4.000e+00] ]
      => #<GSL::Vector::Complex:0x6c5b9c>
      irb(main):011:0> z[1]
      => GSL::Complex
      [ 2.000000 5.000000 ]
      irb(main):012:0> z[-1]
      => GSL::Complex
      [ -3.000000 4.000000 ]
      irb(main):013:0> z[0, 2]
      [ [0.000e+00 1.000e+00] [-3.000e+00 4.000e+00] ]
      => #<GSL::Vector::Complex:0x6bfbac>

--- GSL::Vector::Complex#set(args, val)
--- GSL::Vector::Complex#[args]=val
    If ((|args|)) is empty, behaves as (({#set_all})) and ((|val|)) must be a
    ((|[re,im]|)) (({Array})), (({Float})), (({Integer})), or
    (({GSL::Complex})).

    If ((|args|)) is a single (({Fixnum})), ((|i|)), sets the ((|i|))-th
    element of the vector ((|self|)) to ((|val|)), which must be a
    ((|[re,im]|)) (({Array})), (({Float})), (({Integer})), or
    (({GSL::Complex})).

    All other ((|args|)) specify a subvector (as with (({#subvector}))) whose
    elements are assigned from ((|val|)).  In this case, ((|val|)) can be an
    (({Array})), (({Range})), (({GSL::Vector::Complex})), or one of the classes
    listed in the previous cases.

    NOTE: GSL does not provide a vector copy function that properly copies data
    across overlapping memory regions, so watch out if assigning to part of a
    Vector from another part of itself (see (({#set})) example of
    ((<GSL::Vector|URL:vector.html>))).

=== Initializing vector elements
--- GSL::Vector::Complex#set_all(z)
    Sets all the elements of the complex vector ((|self|)) to the complex ((|z|)).
--- GSL::Vector::Complex#set_zero
    Sets all the elements of the vector ((|self|)) to zero.
--- GSL::Vector::Complex#set_real(x)
--- GSL::Vector::Complex#real=(x)
--- GSL::Vector::Complex#re=(x)
    Sets the real component of all elements of the vector ((|self|)) to
    ((|x|)).  Currently, ((|x|)) must be a scalar, but a future Ruby GSL
    version could accept a GSL::Vector.
--- GSL::Vector::Complex#set_imag(x)
--- GSL::Vector::Complex#imag=(x)
--- GSL::Vector::Complex#im=(x)
    Sets the imaginary component of all elements of the vector ((|self|)) to
    ((|x|)).  Currently, ((|x|)) must be a scalar, but a future Ruby GSL
    version could accept a GSL::Vector.

=== Vector Properties
--- GSL::Vector::Complex#size
--- GSL::Vector::Complex#len
--- GSL::Vector::Complex#length
    Return the vector length.

--- GSL::Vector::Complex#stride
    Return the vector stride.

=== Iterators
--- GSL::Vector::Complex#each
--- GSL::Vector::Complex#each_index
--- GSL::Vector::Complex#collect
--- GSL::Vector::Complex#map
--- GSL::Vector::Complex#collect!
--- GSL::Vector::Complex#map!

=== Reordering Elements
(({GSL::Vector::Complex})) provides four methods for shifting the frequency
domain data between ((*FFT order*)), shown in the table in the ((<Overview of
complex data FFTs|URL:fft.html#2.1>)), and ((*natural order*)), which has the
most negative freqeuncy component first, the zero frequency component in the
middle, and the most positive frequency component last.  For more information
on Ruby/GSL and FFTs, see ((<Fast Fourier Transforms|URL:fft.html>)).

--- GSL::Vector::Complex#fftshift
--- GSL::Vector::Complex#fftshift!
    Shifts the data of ((|self|)) from FFT order to natural order.  The
    (({#fftshift})) method leaves ((|self|)) unmodified and returns a new
    (({GSL::Vector::Complex})) object containing the shifted data.  The
    (({#fftshift!})) method modifies ((|self|)) in-place and returns
    ((|self|)).  Note that (({#fftshift})) and (({#ifftshift})) are equivalent
    for even lengths, but not for odd lengths.

--- GSL::Vector::Complex#ifftshift
--- GSL::Vector::Complex#ifftshift!
    Shifts the data of ((|self|)) from natural order to FFT order.  The
    (({#ifftshift})) method leaves ((|self|)) unmodified and returns a new
    (({GSL::Vector::Complex})) object containing the shifted data.  The
    (({#ifftshift!})) method modifies ((|self|)) in-place and returns
    ((|self|)).  Note that (({#fftshift})) and (({#ifftshift})) are equivalent
    for even lengths, but not for odd lengths.

=== Arithmetic
--- GSL::Vector::Complex#+(other)
--- GSL::Vector::Complex#-(other)
--- GSL::Vector::Complex#*(other)
--- GSL::Vector::Complex#/(other)
--- GSL::Vector::Complex#add(other)
--- GSL::Vector::Complex#sub(other)
--- GSL::Vector::Complex#mul(other)
--- GSL::Vector::Complex#div(other)
    Returns a new (({GSL::Vector::Complex})) instance containing the result of
    the appropriate arithmetic operation on ((|self|)) and ((|other|)).  The
    inputs are unchanged.  The ((|other|)) parameter may be a scalar,
    (({((<GSL::Vector|URL:vector.html>))})), or (({GSL::Vector::Complex})).

--- GSL::Vector::Complex#+=(other)
--- GSL::Vector::Complex#-=(other)
--- GSL::Vector::Complex#*=(other)
--- GSL::Vector::Complex#/=(other)
--- GSL::Vector::Complex#add!(other)
--- GSL::Vector::Complex#sub!(other)
--- GSL::Vector::Complex#mul!(other)
--- GSL::Vector::Complex#div!(other)
    Modifies ((|self|)) in place to contain the result of the appropriate
    arithmetic operation on ((|self|)) and ((|other|)).  The ((|other|))
    parameter may be a scalar, (({((<GSL::Vector|URL:vector.html>))})), or
    (({GSL::Vector::Complex})).

=== Reading and writing vectors
--- GSL::Vector::Complex#fwite(io)
--- GSL::Vector::Complex#fread(io)
--- GSL::Vector::Complex#fprintf(io, format)
--- GSL::Vector::Complex#fscanf(io)

=== Functions
--- GSL::Vector::Complex#conj
--- GSL::Vector::Complex#conjugate
    Returns a new (({GSL::Vector::Complex})) that is the complex conjugate of
    ((|self|)).

--- GSL::Vector::Complex#conj!
--- GSL::Vector::Complex#conjugate!
    Conjugates ((|self|)) in-place and returns ((|self|)).

--- GSL::Vector::Complex#arg
--- GSL::Vector::Complex#angle
--- GSL::Vector::Complex#phase
    Calculates the argument (i.e. phase angle in radians) of each of the
    complex elements of the vector ((|self|)) and returns a real vector.

--- GSL::Vector::Complex#abs2
    Calculates the squared magnitude of the complex elements of the vector
    ((|self|)) and returns a real vector.

--- GSL::Vector::Complex#abs
--- GSL::Vector::Complex#amp
    Calculates the magnitude of the complex elements of the vector ((|self|))
    and returns a real vector.

--- GSL::Vector::Complex#logabs
    Calculates the natural logarithm of the magnitude of the complex elements
    of the vector ((|self|)) and returns a real vector.

--- GSL::Vector::Complex#sqrt
    Calculates the square root of the complex elements of the vector ((|self|))
    and returns a new complex vector.

--- GSL::Vector::Complex#exp
--- GSL::Vector::Complex#pow(a)
--- GSL::Vector::Complex#log
--- GSL::Vector::Complex#log10
--- GSL::Vector::Complex#log_b(base)
--- GSL::Vector::Complex#sin
--- GSL::Vector::Complex#cos
--- GSL::Vector::Complex#tan
--- GSL::Vector::Complex#sec
--- GSL::Vector::Complex#csc
--- GSL::Vector::Complex#cot
--- GSL::Vector::Complex#arcsin
--- GSL::Vector::Complex#arccos
--- GSL::Vector::Complex#arctan
--- GSL::Vector::Complex#arcsec
--- GSL::Vector::Complex#arccsc
--- GSL::Vector::Complex#arccot
--- GSL::Vector::Complex#sinh
--- GSL::Vector::Complex#cosh
--- GSL::Vector::Complex#tanh
--- GSL::Vector::Complex#sech
--- GSL::Vector::Complex#csch
--- GSL::Vector::Complex#coth
--- GSL::Vector::Complex#arcsinh
--- GSL::Vector::Complex#arccosh
--- GSL::Vector::Complex#arctanh
--- GSL::Vector::Complex#arcsech
--- GSL::Vector::Complex#arccsch
--- GSL::Vector::Complex#arccoth

=== Statistics
--- GSL::Vector::Complex#sum
    Returns a (({GSL::Complex})) object representing the sum of all elements of
    ((|self|)).
--- GSL::Vector::Complex#mean
    Returns a (({GSL::Complex})) object representing the mean of all elements
    of ((|self|)).
--- GSL::Vector::Complex#tss
    Returns the total sum of squares about (({self.mean})).  This is a real
    number, i.e. a (({Float})).
--- GSL::Vector::Complex#tss_m(mean)
    Returns the total sum of squares about ((|mean|)).  This is a real number,
    i.e. a (({Float.}))
--- GSL::Vector::Complex#variance
    Returns the variance of ((|self|)).  This is a real number, i.e. a
    (({Float.}))
--- GSL::Vector::Complex#variance_m(mean)
    Returns the variance of ((|self|)) around ((|mean|)).  This is a real
    number, i.e. a (({Float})).
--- GSL::Vector::Complex#variance_fm(mean)
    Returns the variance of ((|self|)) around the fixed mean ((|mean|)).  This
    is a real number, i.e. a (({Float})).
--- GSL::Vector::Complex#sd
    Returns the standard deviation of ((|self|)).  This is a real number, i.e.
    a (({Float})).
--- GSL::Vector::Complex#sd_m(mean)
    Returns the standard deviation of ((|self|)) around ((|mean|)).  This is a
    real number, i.e. a (({Float})).
--- GSL::Vector::Complex#sd_fm(mean)
    Returns the standard deviation of ((|self|)) around the fixed mean
    ((|mean|)).  This is a real number, i.e. a (({Float})).

== Data Conversions
--- GSL::Vector#to_complex
--- GSL::Vector#to_complex2
    Create a complex vector from a real vector.

      irb(main):002:0> v = Vector[1..4]
      => GSL::Vector
      [ 1.000e+00 2.000e+00 3.000e+00 4.000e+00 ]
      irb(main):003:0> v.to_complex
      [ [1.000e+00 0.000e+00] [2.000e+00 0.000e+00] [3.000e+00 0.000e+00] [4.000e+00 0.000e+00] ]
      => #<GSL::Vector::Complex:0x6d7d24>
      irb(main):004:0> v.to_complex2
      [ [1.000e+00 2.000e+00] [3.000e+00 4.000e+00] ]
      => #<GSL::Vector::Complex:0x6d6424>

((<Reference index|URL:ref.html>))
((<top|URL:index.html>))

=end
