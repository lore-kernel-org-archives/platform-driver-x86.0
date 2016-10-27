From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for X1 Yoga (2016) Tablet Mode
Date: Thu, 27 Oct 2016 15:54:04 -0200
Message-ID: <20161027175404.GA25503@khazad-dum.debian.net>
References: <1477433543-14915-1-git-send-email-lyude@redhat.com>
 <1477579932.3666.4.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477579932.3666.4.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 27 Oct 2016, Lyude Paul wrote:
> as well, can someone confirm this patch made it to the ibm-acpi-devel
> list? When I originally sent this I realized I wasn't subscribed to the
> list, so I'm guessing I might need to resend.

I received it.  I just didn't have the time to go over it in detail.

At first look, it seems correct...

> > +	/* For X1 Yoga (2016) */
> > +	if (!res && acpi_evalf(ec_handle, &status, "CMMD", "qd")) {
> > +		tp_features.hotkey_tablet = 1;
> > +		tp_features.hotkey_tablet_cmmd = 1;
> > +		tabletsw_state = (status == TP_EC_CMMD_TABLET_MODE);
> > +
> > +		pr_info("Possible tablet mode switch found; ThinkPad
> > in %s mode\n",
> > +			(tabletsw_state) ? "tablet" : "laptop");
> > +		res = add_to_attr_set(hotkey_dev_attributes,
> > +				      &dev_attr_hotkey_tablet_mode.a
> > ttr);
> > +	}

Ehh... the code doesn't act as if it were a "possible" switch, but
rather that it _did_ find a x1_yoga-style switch, so the debug message
should be assertive to match the code:

pr_info("Tablet mode switch found (X1 Yoga style), Thinkpad is in...")

or something to that effect.

If the code is wrong, and it has false possitives, we enhance the
detection (possibly by using a quirk table if we must).

Care to respin with that change?

-- 
  Henrique Holschuh
