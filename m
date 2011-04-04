From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Mon, 4 Apr 2011 16:44:27 +0200
Message-ID: <BANLkTimvi53PWhN9HO4f04p_U-vae8D5Hw@mail.gmail.com>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
	<20110404122225.GA15883@srcf.ucam.org>
	<1301921369.1941.29.camel@Joe-Laptop>
	<20110404130036.GB16669@srcf.ucam.org>
	<BANLkTimqp6FwLJP3d3dYcx7-Ut9pMjdtFA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTimqp6FwLJP3d3dYcx7-Ut9pMjdtFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Joe Perches <joe@perches.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, ibm-acpi@hmh.eng.br
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 4, 2011 at 3:44 PM, Sedat Dilek <sedat.dilek@googlemail.com=
> wrote:
> On Mon, Apr 4, 2011 at 3:00 PM, Matthew Garrett <mjg@redhat.com> wrot=
e:
>> On Mon, Apr 04, 2011 at 05:49:29AM -0700, Joe Perches wrote:
>>
>>> It's vdbg_printk no_printk verification.
>>>
>>> #ifdef CONFIG_THINKPAD_ACPI_DEBUG
>>> #define vdbg_printk dbg_printk
>>> static const char *str_supported(int is_supported);
>>> #else
>>> #define vdbg_printk(a_dbg_level, format, arg...) =C2=A0 =C2=A0 =C2=A0=
\
>>> =C2=A0 =C2=A0 =C2=A0 no_printk(format, ##arg)
>>> #endif
>>>
>>> Two ways to handle this.
>>>
>>> 1: add
>>> static inline const char *str_supported(int is_supported) { return =
""; }
>>> to the #else
>>>
>>> 2: Remove no_printk verification and return it to do {} while (0)
>>>
>>> Do you have a preference?
>>
>> I don't. Henrique?
>>
>> --
>> Matthew Garrett | mjg59@srcf.ucam.org
>>
>
> I have tried with solution #2 as it partially restores old behaviour
> (patch is attached).
>
> - Sedat -
>

Please feel free to add a:

     Reported-by: Sedat Dilek <sedat.dilek@gmail.com>

=46or solution #2 :

     Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -
