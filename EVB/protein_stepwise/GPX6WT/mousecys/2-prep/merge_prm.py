from Qpyl.core.qparameter import QPrm, QPrmError


parameters = QPrm('oplsaa')
parameters.read_prm('qoplsaa_all.prm')
parameters.read_prm('HO2.prm')
parameters.read_prm('SUL.prm')
parameters.read_prm('GLNP.prm')

with open('qoplsaa_all2.prm', 'w') as f:
    f.write(parameters.get_string())




