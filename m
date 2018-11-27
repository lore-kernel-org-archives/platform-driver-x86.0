From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v16 22/22] x86/sgx: SGX documentation
Date: Tue, 27 Nov 2018 21:13:38 +0100
Message-ID: <20181127201338.GB20692@amd>
References: <20181106134758.10572-1-jarkko.sakkinen@linux.intel.com>
 <20181106134758.10572-23-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181106134758.10572-23-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Documentation of the features of the Software Guard eXtensions used
> by the Linux kernel and basic design choices for the core and driver
> and functionality.

> --- /dev/null
> +++ b/Documentation/x86/intel_sgx.rst
> @@ -0,0 +1,201 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Intel(R) SGX driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Intel(R) SGX is a set of CPU instructions that can be used by applicatio=
ns to
> +set aside private regions of code and data. The code outside the enclave=
 is
> +disallowed to access the memory inside the enclave by the CPU access con=
trol.
> +In a way you can think that SGX provides inverted sandbox. It protects t=
he
> +application from a malicious host.

Spelling out "Software Guard eXtensions" somewhere around here would
be nice.

As would be notice that due to Spectre / Meltdown / L1TF / ... this
sandboxing functionality does not really work on any CPU that is on
the market today.


> +Enclave can only execute code inside the ELRANGE. Instructions that may =
cause
> +VMEXIT, IO instructions and instructions that require a privilege change=
 are
> +prohibited inside the enclave. Interrupts and exceptions always cause en=
clave
> +to exit and jump to an address outside the enclave given when the enclav=
e is
> +entered by using the leaf instruction ENCLS(EENTER).


> +Launch control
> +--------------
> +
> +To launch an enclave, two structures must be provided for ENCLS(EINIT):
> +
> +1. **SIGSTRUCT:** signed measurement of the enclave binary.
> +2. **EINITTOKEN:** a cryptographic token CMAC-signed with a AES256-key c=
alled
> +   *launch key*, which is re-generated for each boot cycle.
> +
> +The CPU holds a SHA256 hash of a 3072-bit RSA public key inside
> +IA32_SGXLEPUBKEYHASHn MSRs. Enclaves with a SIGSTRUCT that is signed wit=
h this
> +key do not require a valid EINITTOKEN and can be authorized with special
> +privileges. One of those privileges is ability to acquire the launch key=
 with
> +ENCLS(EGETKEY).
> +
> +**IA32_FEATURE_CONTROL[17]** is used by the BIOS configure whether
> +IA32_SGXLEPUBKEYHASH MSRs are read-only or read-write before locking the
> +feature control register and handing over control to the operating syste=
m.

Would it be possible to explain what this means? Basically my BIOS
decides what enclaves I can run? Who generates the EINITTOKENs and can
my code get one?=20

What other priviledges does signed SIGSTRUCT give to the enclave?

> +Launching enclaves
> +------------------
> +
> +The current kernel implementation supports only unlocked MSRs i.e.
> +FEATURE_CONTROL_SGX_LE_WR must be set. The launch is performed by settin=
g the
> +MSRs to the hash of the public key modulus of the enclave signer, which =
is one
> +of the fields in the SIGSTRUCT.

Aha, so in current kernel implementation kernel decides what enclaves
I can run?

Anyway, all this is "interesting reading" but not really suitable for
system administrator who is not expert in Intel CPUs. Do we need some
kind of explanation for ARM kernel hackers, system administrators and
other interested parties?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv9pXIACgkQMOfwapXb+vK7VQCcDuktVD3svHKCgW5RurdIi+2f
0yEAn3aIi6SeyfMyF1hr4we7uTEG6c5J
=XkFd
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
