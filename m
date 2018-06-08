From: Jethro Beekman <jethro@fortanix.com>
Subject: Re: [PATCH v11 12/13] intel_sgx: driver documentation
Date: Fri, 8 Jun 2018 11:32:17 -0700
Message-ID: <6200618e-bcc8-23ba-afe8-4c6be8b364f0@fortanix.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-13-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms060606030706060906050100"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-13-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms060606030706060906050100
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2018-06-08 10:09, Jarkko Sakkinen wrote:
> +Launching enclaves
> +------------------
> +
> +For privileged enclaves the launch is performed simply by submitting t=
he
> +SIGSTRUCT for that enclave to ENCLS(EINIT). For unprivileged enclaves =
the
> +driver hosts a process in ring-3 that hosts a launch enclave signed wi=
th a key
> +supplied for kbuild.
> +
> +The current implementation of the launch enclave generates a token for=
 any
> +enclave. In the future it could be potentially extended to have ways t=
o
> +configure policy what can be lauched.
> +
> +The driver will fail to initialize if it cannot start its own launch e=
nclave.
> +A user space application can submit a SIGSTRUCT instance through the i=
octl API.
> +The kernel will take care of the rest.
> +
> +This design assures that the Linux kernel has always full control, whi=
ch
> +enclaves get to launch and which do not, even if the public key MSRs a=
re

As discussed previously at length, since the kernel needs to execute=20
ENCLS[EINIT], it has full control to deny the launching of enclaves=20
regardless of any launch enclave implementation. Please change this=20
misleading statement.

> +read-only. Having launch intrinsics inside the kernel also enables eas=
y
> +development of enclaves without necessarily needing any heavy weight S=
DK.
> +Having a low-barrier to implement enclaves could make sense for exampl=
e for
> +system daemons where amount of dependecies ought to be minimized.

--
Jethro Beekman | Fortanix


--------------ms060606030706060906050100
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CyAwggUyMIIEGqADAgECAhEA8MVmReo60XmFXNF7R8+qGDANBgkqhkiG9w0BAQsFADCBlzEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTcwOTE0MDAw
MDAwWhcNMTgwOTE0MjM1OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNqZXRocm9AZm9ydGFuaXgu
Y29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz7i2PMd8+ac44evn+E/vAnvp
p3rSuGpPBG8a5a7TomxjN1KilgX7juFiY7LZjZZe955hCzCoou+lyNgCCSbZzcKsYuIyydkj
UBBGIcTSblxCbko21J3yyk0JwAwSoaxlZwKrsbjUTHSl/0E6SBQpybRZsAficbdSRz+s7jG7
f6DtnikAtTYof+mBxwZC30Gzxh3RQEjA0PwaSP35tXffrplfazeog099eiVWLIDYA/kSaiac
SgheMK02Wi0Iu0fGZ3Y9QMVaB2r5Bhm+hODvJv/WAjEUuZGwo3K4aR/934W79pq5bXwUReXy
/5VxE1acjz6rFnCqBJuNgrzDiGF4ywIDAQABo4IB6TCCAeUwHwYDVR0jBBgwFoAUgq9sjPjF
/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFH990qeqLXTAXNqiGOMUQIhUf9TWMA4GA1UdDwEB
/wQEAwIFoDAMBgNVHRMBAf8EAjAAMCAGA1UdJQQZMBcGCCsGAQUFBwMEBgsrBgEEAbIxAQMF
AjARBglghkgBhvhCAQEEBAMCBSAwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAQEwKzApBggr
BgEFBQcCARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2g
S4ZJaHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRp
b25hbmRTZWN1cmVFbWFpbENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklo
dHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5j
b20wHgYDVR0RBBcwFYETamV0aHJvQGZvcnRhbml4LmNvbTANBgkqhkiG9w0BAQsFAAOCAQEA
BzIiuD+ggLjwfH5xKn7eotgwkH3V6qCWD21G1++PIxuLjCzRN87rMOZcmrMa2HJkDVz4NZYe
Er98p40JKNNVabKBI8+aF79Gfl0y3Mojr53ojV+x0wt2U04EmOXONuCHdLgxv5JvReFLXo6h
bIZQoe4Cwfgj541QPLDzoSuMrMUAcNSjt6o/SIeIu+Udv84ET2YckxiBXDiKUXRfW+GWet3w
1tUYrUSfwTA7Ho2YUbZu/L4FFRrUXQD6zYrB3f0sStDxWijKsRwLrdzqKVs0hsu42wZcNR/v
YzWnJQBVuCIpr0I/rTHY4E8w5h0Hz5mPABkNxLfOYKRJ1VUMQSgHGzCCBeYwggPOoAMCAQIC
EGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYD
VQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNP
TU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdC
MRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQ
PTRI5Or1u6zf+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivl
JTRENf+RKwrB6vcfWlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG
9qrxpZxyb4o4yNNwTqzaaPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoS
WY66nJN/VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQAB
o4IBPDCCATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKv
bIz4xf6WYXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEA
MBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9k
b2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDBxBggrBgEFBQcB
AQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUFk
ZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wDQYJ
KoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7TcePo
7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaB
Q+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKS
TvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY
+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5td
hYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJ
M/1tyZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJU
mpvVdZ4ognzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTK
TlL8YXLI8nAbR9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIEODCCBDQCAQEw
ga0wgZcxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNV
BAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01P
RE8gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA8MVm
Reo60XmFXNF7R8+qGDANBglghkgBZQMEAgEFAKCCAlswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMTgwNjA4MTgzMjE3WjAvBgkqhkiG9w0BCQQxIgQgVRgE
adROmDvovjccWEDwlJxklUQ7Hop0RboPwu5++1gwbAYJKoZIhvcNAQkPMV8wXTALBglghkgB
ZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG
9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBvgYJKwYBBAGCNxAEMYGwMIGtMIGX
MQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdT
YWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPDFZkXqOtF5
hVzRe0fPqhgwgcAGCyqGSIb3DQEJEAILMYGwoIGtMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UE
CBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01P
RE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRp
b24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPDFZkXqOtF5hVzRe0fPqhgwDQYJKoZIhvcNAQEB
BQAEggEATIo6aTpqOEsSzhh47mSjs+vds4ZuvhEIbzW/YIJIpKruM73BS2S6UK1QyVG1jkhg
XWhn03ca+CibD6M+4qTPuZDiBJrq+BPEzAEu+W7NPAu/NGSfNxe8QCp3NAo+eGBiEOyKo/qP
LHDwoNI1zHF3jgA34H7G2vaM8kchmz5lYMiWrLYeP9Bi3GUybefWCJ9sB2C06jEeCGw8wPrU
NL4JyfoD0adjnp5wncNu7cUIJz+FT6NEUUmguLe6zB3wXVb5RYuKqJ7nIsUmW/7O3kYa+Zfw
/7hNUXqBZoJnMgRV56A+28+9mr6jHnon3jWAo9v/p6ker0x2bTVzE/ocAJ0/JQAAAAAAAA==
--------------ms060606030706060906050100--
