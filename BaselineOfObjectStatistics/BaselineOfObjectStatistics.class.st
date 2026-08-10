Class {
	#name : 'BaselineOfObjectStatistics',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfObjectStatistics',
	#package : 'BaselineOfObjectStatistics'
}

{ #category : 'baselines' }
BaselineOfObjectStatistics >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'StateSpecs' with: [
			spec 
				repository: 'github://oliveiraallex/StateSpecs:dev13';
				loads: 'Core' ].
		spec baseline: 'Mocketry' with: [
			spec repository: 'github://oliveiraallex/Mocketry:dev13' ].
		spec 
			package: 'ObjectStatistics' with: [spec requires: #('StateSpecs')];
			package: 'ObjectStatistics-Tests' with: [spec requires: #('ObjectStatistics' 'Mocketry')];
			package: 'ObjectStatistics-NewTools' with: [spec requires: #('ObjectStatistics')].
		spec 
			group: 'default' with: #('Core' 'ObjectStatistics-NewTools' 'Tests');
			group: 'Core' with: #('ObjectStatistics');
			group: 'Tests' with: #('ObjectStatistics-Tests') ]

]

{ #category : 'accessing' }
BaselineOfObjectStatistics >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]
