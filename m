From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2] platform/x86: dell-smbios-wmi: Disable userspace
 interface if missing hotfix
Date: Mon, 20 Nov 2017 16:03:53 +0000
Message-ID: <4f2192b6a6ed4764b5645efa7f6f2a54@ausx13mpc120.AMER.DELL.COM>
References: <1510891992-31659-1-git-send-email-mario.limonciello@dell.com>
 <20171117203922.GG22250@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171117203922.GG22250@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, November 17, 2017 2:39 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH v2] platform/x86: dell-smbios-wmi: Disable userspace
> interface if missing hotfix
>=20
> On Thu, Nov 16, 2017 at 10:13:12PM -0600, Mario Limonciello wrote:
> > The Dell SMBIOS WMI interface will fail for some more complex calls unl=
ess
> > a WMI hotfix has been included.  Most platforms have this fix available=
 in
> > a maintenance BIOS release.  In the case the driver is loaded on a
> > platform without this fix, disable the userspace interface.
> >
> > A hotfix indicator is present in the dell-wmi-descriptor that represent=
s
> > whether or not more complex calls will work properly.
> >
> > "Simple" calls such as those used by dell-laptop and dell-wmi will cont=
inue
> > to work properly so dell-smbios-wmi should not be blocked from binding =
and
> > being used as the dell-smbios dispatcher.
> >
> > Suggested-by: Girish Prakash <girish.prakash@dell.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>=20
> Queued up, thanks Mario.

Darren, even though this came after the merge windows opened considering th=
is=20
restricts the SMBIOS interface from some platform/firmware combinations it=
=20
shouldn't be offered, do you think this can be included with a future 4.15=
=20
RCx PR so it can land with the rest of the series rather than targeted for =
4.16?

I'd hate to get stuck in a situation that an interface deemed "broken" gets=
 offered
to people it shouldn't.
