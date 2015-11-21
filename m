From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Fix keyboard backight sysfs entries not
 being updated
Date: Fri, 20 Nov 2015 16:46:47 -0800
Message-ID: <20151121004647.GM7413@malice.jf.intel.com>
References: <1447703971-8079-1-git-send-email-coproscefalo@gmail.com>
 <20151120233956.GF7413@malice.jf.intel.com>
 <CAGdLNWF66_R1DB3mQDqTMQMxUMLv9zidOc+upa-AabFQBzkqGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54021 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760389AbbKUAqs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:46:48 -0500
Content-Disposition: inline
In-Reply-To: <CAGdLNWF66_R1DB3mQDqTMQMxUMLv9zidOc+upa-AabFQBzkqGA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 20, 2015 at 04:55:06PM -0700, Azael Avalos wrote:
> Hi Darren,
>=20
> 2015-11-20 16:39 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> > On Mon, Nov 16, 2015 at 12:59:31PM -0700, Azael Avalos wrote:
> >> Certain Toshiba models with the second generation keyboard backlig=
ht
> >> (type 2) do not generate the keyboard backlight changed event (0x9=
2),
> >> and thus, the sysfs entries are never being updated.
> >>
> >> This patch adds a workquee and a global boolean variable to addres=
s
> >> the issue.
> >>
> >> For those models that do generate the event, the sysfs entries are
> >> being updated via the *notify function and the boolean is set to
> >> true to avoid a second call to update the entries.
> >>
> >> For those models that do not generate the event, the workquee is
> >> used to update the sysfs entries and also to emulate the event via
> >> netlink, to make userspace aware of such change.
> >
> > Thanks Azael,
> >
> > Rather than ask you to wait while I research workqueues and their u=
se more, what
> > is it about this task that requires a workqueue? Why can we not cal=
l what's in
> > the workqueue below directly from the kbd_backlight_mode_store sysf=
s write
> > callback?
>=20
> I used the workquee to let the sysfs *store function to finish w/o af=
fecting
> the "refresh" of the sysfs entries.
>=20
> Previously the sysfs_update_group resided inside the *store function,
> but caused a lock everytime the keyboard mode was changed, and the
> sysfs entries were never updated, this was fixed by moving such funct=
ion
> to the *notify function, but turns out that some models do not fire s=
uch
> event.

OK, got it - thanks. Now:

drivers/platform/x86/toshiba_acpi.c: In function =E2=80=98toshiba_acpi_=
kbd_bl_work=E2=80=99:
drivers/platform/x86/toshiba_acpi.c:1547:12: error: =E2=80=98toshiba_at=
tr_group=E2=80=99
undeclared (first use in this function)
           &toshiba_attr_group))
	               ^
Looks like your static global declaration just comes too late, but... h=
ow did
this compile for you?

--=20
Darren Hart
Intel Open Source Technology Center
