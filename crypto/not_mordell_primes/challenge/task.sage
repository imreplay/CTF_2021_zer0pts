from Crypto.Util.number import bytes_to_long
from secrets import k, FLAG


p = 13046889097521646369087469608188552207167764240347195472002158820809408567610092324592843361428437763328630003678802379234688335664907752858268976392979073
a = 10043619664651911066883029686766120169131919507076163314397915307085965058341170072938120477911396027902856306859830431800181085603701181775623189478719241
b = 12964455266041997431902182249246681423017590093048617091076729201020090112909200442573801636087298080179764338147888667898243288442212586190171993932442177

E = EllipticCurve(GF(p),[a,b])

P = E(11283606203023552880751516189906896934892241360923251780689387054183187410315259518723242477593131979010442607035913952477781391707487688691661703618439980, 12748862750577419812619234165922125135009793011470953429653398381275403229335519006908182956425430354120606424111151410237675942385465833703061487938776991)
Q = k*P
R = (k+1)*P

p = int(Q[0])
q = int(R[0])

assert is_prime(p)
assert is_prime(q)

e = 0x10001
N = p*q
m = bytes_to_long(FLAG)
c = pow(m,e,N)

print(f'N = {N}')
print(f'c = {c}')