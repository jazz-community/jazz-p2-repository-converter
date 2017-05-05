param (
    [Alias('l')][string]$launcher,
    [Alias('d')][string]$dest,
    [Alias('s')][string]$sdk
)

# more input validation would be nice here
java -jar $launcher `
    -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher `
    -metadataRepository file:/$dest `
    -artifactRepository file:/$dest `
    -source $sdk `
    -publishArtifacts `
    -compress
