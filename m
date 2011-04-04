From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Mon, 4 Apr 2011 15:44:34 +0200
Message-ID: <BANLkTimqp6FwLJP3d3dYcx7-Ut9pMjdtFA@mail.gmail.com>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
	<20110404122225.GA15883@srcf.ucam.org>
	<1301921369.1941.29.camel@Joe-Laptop>
	<20110404130036.GB16669@srcf.ucam.org>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=20cf3020746ac904d304a017f55f
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20110404130036.GB16669@srcf.ucam.org>
Sender: linux-next-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Joe Perches <joe@perches.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, ibm-acpi@hmh.eng.br
List-Id: platform-driver-x86.vger.kernel.org

--20cf3020746ac904d304a017f55f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 4, 2011 at 3:00 PM, Matthew Garrett <mjg@redhat.com> wrote:
> On Mon, Apr 04, 2011 at 05:49:29AM -0700, Joe Perches wrote:
>
>> It's vdbg_printk no_printk verification.
>>
>> #ifdef CONFIG_THINKPAD_ACPI_DEBUG
>> #define vdbg_printk dbg_printk
>> static const char *str_supported(int is_supported);
>> #else
>> #define vdbg_printk(a_dbg_level, format, arg...) =C2=A0 =C2=A0 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 no_printk(format, ##arg)
>> #endif
>>
>> Two ways to handle this.
>>
>> 1: add
>> static inline const char *str_supported(int is_supported) { return ""; }
>> to the #else
>>
>> 2: Remove no_printk verification and return it to do {} while (0)
>>
>> Do you have a preference?
>
> I don't. Henrique?
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>

I have tried with solution #2 as it partially restores old behaviour
(patch is attached).

- Sedat -

--20cf3020746ac904d304a017f55f
Content-Type: text/x-patch; charset=US-ASCII; name="thinkpad_acpi-fix.patch"
Content-Disposition: attachment; filename="thinkpad_acpi-fix.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gm3ga9rf0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYyBiL2RyaXZl
cnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYwppbmRleCBkOGYzZTY1Li45ODNlNDJmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni90aGlua3BhZF9hY3BpLmMKKysrIGIvZHJp
dmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jCkBAIC0zOTEsNyArMzkxLDcgQEAgZG8g
ewkJCQkJCQkJCVwKIHN0YXRpYyBjb25zdCBjaGFyICpzdHJfc3VwcG9ydGVkKGludCBpc19zdXBw
b3J0ZWQpOwogI2Vsc2UKICNkZWZpbmUgdmRiZ19wcmludGsoYV9kYmdfbGV2ZWwsIGZvcm1hdCwg
YXJnLi4uKQlcCi0Jbm9fcHJpbnRrKGZvcm1hdCwgIyNhcmcpCisJZG8geyB9IHdoaWxlICgwKQog
I2VuZGlmCiAKIHN0YXRpYyB2b2lkIHRwYWNwaV9sb2dfdXNlcnRhc2soY29uc3QgY2hhciAqIGNv
bnN0IHdoYXQpCg==
--20cf3020746ac904d304a017f55f--
