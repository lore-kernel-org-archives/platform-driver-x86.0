From: Andy Ross <andy.ross@windriver.com>
Subject: Re: [PATCH 3/4] asus-laptop: Pegatron Lucid accelerometer
Date: Mon, 28 Mar 2011 08:36:32 -0700
Message-ID: <4D90AB00.5080800@windriver.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com> <1301004130-3294-4-git-send-email-andy.ross@windriver.com> <AANLkTin849Cr2UUv4astP860=_f5xMMoPAhFhA4K+rzZ@mail.gmail.com> <20110328054314.GC31692@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from li44-10.members.linode.com ([72.14.181.10]:38729 "EHLO
	plausible.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751237Ab1C1Pgg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2011 11:36:36 -0400
In-Reply-To: <20110328054314.GC31692@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

[combined responses for clarity]

Corentin Chary wrote:
> Wow :/ How long is an acpi_evaluate_integer call here ?

Early on I benchmarked the per-axis ACPI calls about about 50us, which
is shockingly high to me.  But honestly that note there is just
pedantry: the hi/lo race (and the fact that "errors" live in the same
space with valid data values) is a real condition that lets me justify
the "retry on large deltas" behavior, which most definitely improves
data quality.

> When is asus_platform_probe called exactly ? Because I'd say it's
> called during asus_platform_probe(), and that doesn't fix your issue
> right ?

Admittedly this is voodoo.  Moving the input_polldev device
initialization to asus_laptop (originally in asus_acpi_add(), which is
called out of the ACPI framwwork) caused reliable panics on boot.  I
moved it to asus_platform_probe() to restore the structure of the
original pega_accel module, which did it in a platform probe.

I don't know enough about the platform driver model to say exactly,
but I strongly suspect that platform probe calls are not done
synchronously underneath the platform_{device|driver}_register()
calls.

Dmitry Torokhov wrote:
> This I do not quite understand... Do we bind acpi drivers to devices
> before ACPI initialization is done? Then this should be fixed in
> ACPI layer, but I doubt even early userspace is active at the time
> ACPI core is being initialized. Also, input polling is done in a
> separate thread so you not moving the poll out of ACPI binding
> thread but delay poll execution by a few microseconds...

See comments above.  The current model in asus-laptop is to register
its keyboard input device underneat the .add callback in the acpi
driver.  That was crashing with the accelerometer.

And there's definitely a userspace interaction: disabling the sensor
daemon (the distro in question is a MeeGo tablet image) at startup
avoided the crash (and in fact worked fine when started up manually
later).

Andy
