From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 2/8] efi: Add embedded peripheral firmware support
Date: Fri, 15 Nov 2019 13:09:59 +0100
Message-ID: <d7546f63-5472-b867-4e79-912edf9cfa6c@redhat.com>
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-3-hdegoede@redhat.com>
 <20191011144834.GL16384@42.do-not-panic.com>
 <e7bd40ff-20d1-3aed-8516-9fffd4c3a207@redhat.com>
 <20191114194233.GE11244@42.do-not-panic.com>
 <f00804ae-e556-35e4-d0a3-cd9201fdd2d0@redhat.com>
 <9b0a0121-3e63-0602-6c0d-00547e389f76@redhat.com>
 <20191114215009.GF11244@42.do-not-panic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191114215009.GF11244@42.do-not-panic.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 14-11-2019 22:50, Luis Chamberlain wrote:
> On Thu, Nov 14, 2019 at 09:48:38PM +0100, Hans de Goede wrote:

<snip>

>> But I guess what you really want is some error to be thrown if someone
>> calls firmware_request_platform() before we are ready.
>=20
> Yes.
>=20
>> I guess I could make efi_check_for_embedded_firmwares() which scans
>> for known firmwares and saved a copy set a flag that it has run.
>>
>> And then combine that with making efi_get_embedded_fw() (which underpins
>> firmware_request_platform()) print a warning when called if that flag
>> is not set yet.

<snip>

> That'd be great.

So I've been working on this, my first though was to use WARN_ON as
calling this too early would be a bug, but there is a bunch of
normal circumstances where efi_check_for_embedded_firmwares() never
runs. One of the being classic BIOS boot, but e.g. also when running
paravirtualized in a paravirt env. using UEFI.

Normally we should not end up calling efi_get_embedded_fw() in those
cases, for one it is unlikely for any drivers using firmware_request_platfo=
rm()
to be used in such an environment, and if we somehow do end up with
a case where firmware_request_platform() is called, since the EFI
emebedded fw fallback then will not work I would expect a copy of
the necessary fw to be under /lib/firmware so we never hit the fallback.

This all makes efi_get_embedded_fw() getting called in cases where
efi_check_for_embedded_firmwares() will never run unlikely, but not
impossible. Making a WARN_ON the wrong thing to do so for v8 of this
patch-set I will add a pr_warn for this.

Note I've looked into detecting all the circumstances where it is normal
for efi_check_for_embedded_firmwares() to never run, but after tracing
the call path leading up to it getting called I've found that a check
for that is complicated and more importantly error-prone and likely
to get out of sync with reality if any of the functions higher up
the call path ever change the conditions.

So a pr_warn it is, and since as explained one would normally not
expect to ever hit the fallback on systems where
efi_check_for_embedded_firmwares() does not get called, I see no
harm in simply always printing the warning if
efi_check_for_embedded_firmwares() was not called.

Regards,

Hans
