From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Mon, 4 Apr 2011 17:08:05 +0200
Message-ID: <BANLkTik19DczZ9uoSQSvv_zpv5fpUR7kCw@mail.gmail.com>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
	<20110404122225.GA15883@srcf.ucam.org>
	<1301921369.1941.29.camel@Joe-Laptop>
	<20110404130036.GB16669@srcf.ucam.org>
	<BANLkTimqp6FwLJP3d3dYcx7-Ut9pMjdtFA@mail.gmail.com>
	<BANLkTimvi53PWhN9HO4f04p_U-vae8D5Hw@mail.gmail.com>
	<1301929346.1941.32.camel@Joe-Laptop>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <1301929346.1941.32.camel@Joe-Laptop>
Sender: linux-next-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, ibm-acpi@hmh.eng.br
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 4, 2011 at 5:02 PM, Joe Perches <joe@perches.com> wrote:
> On Mon, 2011-04-04 at 16:44 +0200, Sedat Dilek wrote:
>> > I have tried with solution #2 as it partially restores old behavio=
ur
>> > (patch is attached).
>
> Partially? =C2=A0Please explain.
>
>

=46rom [1] (platform-drivers-x86.git#linux-next):
=2E..
 #ifdef CONFIG_THINKPAD_ACPI_DEBUG
 #define vdbg_printk dbg_printk
 static const char *str_supported(int is_supported);
 #else
-#define vdbg_printk(a_dbg_level, format, arg...) \
-       do { } while (0)
+#define vdbg_printk(a_dbg_level, format, arg...)       \
+       no_printk(format, ##arg)
 #endif
=2E..

- Sedat -

[1] http://git.kernel.org/?p=3Dlinux/kernel/git/mjg59/platform-drivers-=
x86.git;a=3Dblobdiff;f=3Ddrivers/platform/x86/thinkpad_acpi.c;h=3Dd8f3e=
653e96d8d5ad2081e4794a8f70f852b20de;hp=3Da08561f5349ef038decaf8edcd7352=
8f30f056a9;hb=3D2af915b1eda9a671973256540035f8a6da1d57b4;hpb=3D1ba77972=
006a7ad5fed0811aac3fed724e7c5a04
