From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1 3/7] platform/mellanox: mlxreg-hotplug: add extra cycle
 for hotplug work queue
Date: Fri, 13 Apr 2018 19:39:58 +0000
Message-ID: <AM6PR0502MB375228AB04E73AAD6560BEAFA2B30@AM6PR0502MB3752.eurprd05.prod.outlook.com>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
 <1522144927-56512-4-git-send-email-vadimp@mellanox.com>
 <20180413164710.GE27560@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180413164710.GE27560@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>, "ivecera@redhat.com" <ivecera@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, April 13, 2018 7:47 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us;
> Michael Shych <michaelsh@mellanox.com>; ivecera@redhat.com
> Subject: Re: [PATCH v1 3/7] platform/mellanox: mlxreg-hotplug: add extra =
cycle
> for hotplug work queue
>=20
> On Tue, Mar 27, 2018 at 10:02:03AM +0000, Vadim Pasternak wrote:
> > It adds missed logic for signal acknowledge, by adding an extra run
> > for work queue in case a signal is received, but no specific signal
> > assertion is detected. Such case theoretically can happen for example
> > in case several units are removed or inserted at the same time. In
> > this situation acknowledge for some signal can be missed at signal top
> > aggreagation status level.
>=20
> Why can they be missed? What does "signal top aggregation status level"
> mean? I'm asking to confirm that we are fixing this at the right place, a=
nd not
> just applying a suboptimal bandaid by running the workqueue more.
>=20

Hi Darren,

Thank for review.

It could happen within the next flow:

The signal routing flow is as following (f.e. for of FANi removing):
 - FAN status and event registers related bit is changed;
 -- intermediate aggregation status register is changed;
 --- top aggregation status register is changed;
 ---- interrupt routed to CPU and interrupt handler is invoked.

When interrupt handler is invoked it follows the next simple logic (f.e
FAN3 is removed):
 (a1) mask top aggregation interrupt mask register;
 (a2) read top aggregation interrupt status register and test to which
      underling group belongs a signal (FANs in this case and is changed
	  from 0xff to 0xfb and 0xfb is saved as a last status value);
   (b1) mask FANs interrupt mask register;
   (b2) read FANs status register and test which FAN has been changed (FAN3=
 in
        this example);
     (c1) perform relevant action;
              <--------------- (FAN2 is removed at this point)
   (b3) clear FANs interrupt event register to acknowledge FAN3 signal;
   (b4) unmask FANs interrupt mask register
 (a3) unmask top aggregation interrupt mask register;
=20
 An interrupt handler is invoked, since FAN2 interrupt is not acknowledge.
 It should set top aggregation interrupt status register bit 6 (0xfb).
 In step (a2)
 (a2) read top aggregation interrupt and comparing it with saved value does=
n't
      show change (same 0xfb) and after (a2) execution jumps to (a3) and
	  signal leaved unhandled.

> ...
>=20
> >
> > Fixes: 1f976f6978bf ("platform/x86: Move Mellanox platform hotplug
> > driver to platform/mellanox")
>=20
> You didn't mention above how this commit caused this - how did moving the
> driver create this problem?=20

Actually I should reference to=20
07b89c2b2a5e ("platform/x86: Introduce support for Mellanox hotplug driver"=
)
which was initial driver commit, before it has been relocated.=20

Does this need to go to stable? I'm assuming not as
> you've called it theoretical - not something you've observed in practice?
>=20

It's not necessary to go to stable.

> ...
>=20
> >  static int mlxreg_hotplug_device_create(struct
> > mlxreg_hotplug_priv_data *priv, @@ -410,6 +413,18 @@ static void
> mlxreg_hotplug_work_handler(struct work_struct *work)
> >  	aggr_asserted =3D priv->aggr_cache ^ regval;
> >  	priv->aggr_cache =3D regval;
> >
> > +	/*
> > +	 * Handler is invoked, but no assertion is detected at top aggregatio=
n
> > +	 * status level. Set aggr_asserted to mask value to allow handler ext=
ra
> > +	 * run over all relevant signals to recover any missed signal.
> > +	 */
> > +	if (priv->not_asserted =3D=3D MLXREG_HOTPLUG_NOT_ASSERT) {
> > +		priv->not_asserted =3D 0;
> > +		aggr_asserted =3D pdata->mask;
> > +	}
> > +	if (!aggr_asserted)
>=20
> We seem to check aggr_asserted in several places in this routine now.
> Looks like something we could simplify. If you check it here, can you dro=
p the
> check lower in the routine? Can you remove it from the for loop if condit=
ional
> entirely? Please consider how to simplify.

OK, will review this code.

>=20
> --
> Darren Hart
> VMware Open Source Technology Center
