From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi - do not treat all devices
 as i2c_clients
Date: Tue, 4 Apr 2017 10:12:54 -0700
Message-ID: <20170404171254.GB29558@dtor-ws>
References: <20170404032514.31832-1-dmitry.torokhov@gmail.com>
 <CAHp75Vc62q7a+0CS3S9TNm+CVPodqG6HT9yoq0d8RBQ0B72REw@mail.gmail.com>
 <20170404160540.GD5936@fury>
 <CAHp75VezdB1PmNUfUzCCKVP7pswkVKJRvLHaAtMJ-W17-Rf3fw@mail.gmail.com>
 <20170404163154.GE5936@fury>
 <CAHp75Vds88+YNRgbhKXPocUOSFQyx8MWHCVFNGQpDqVvCHQCiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33574 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751092AbdDDRM5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 13:12:57 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vds88+YNRgbhKXPocUOSFQyx8MWHCVFNGQpDqVvCHQCiQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 04, 2017 at 07:33:30PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 4, 2017 at 7:31 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Tue, Apr 04, 2017 at 07:08:28PM +0300, Andy Shevchenko wrote:
> >> On Tue, Apr 4, 2017 at 7:05 PM, Darren Hart <dvhart@infradead.org> wrote:
> >> > On Tue, Apr 04, 2017 at 04:45:05PM +0300, Andy Shevchenko wrote:
> >> >> On Tue, Apr 4, 2017 at 6:25 AM, Dmitry Torokhov
> >> >> <dmitry.torokhov@gmail.com> wrote:
> >> >> > I2C bus has both i2c clients and adapter devices, so we must be careful in
> >> >> > notifier code and verify that we are actually dealing with an i2c client
> >> >> > before using it as such.
> >> >>
> >> >> > -static void silead_ts_dmi_add_props(struct device *dev)
> >> >> > +static void silead_ts_dmi_add_props(struct i2c_client *client)
> >> >> >  {
> >> >>
> >> >> > -       struct i2c_client *client = to_i2c_client(dev);
> >> >>
> >> >> I would replace this by
> >> >> struct device *dev = &client->dev;
> >> >>
> >> >> Otherwise looks good for me.
> >> >
> >> > Andy, this series looks like a candidate for 4.11-fixes. We're already at rc5
> >> > though, so if we are going to do that, I'd like to see a stronger statement in
> >> > the commit log about how this issue manifests currently - if it does.
> >>
> >> It makes less changes for any (potentially) backported code.
> >> I'm not insisting and even can do myself.

OK, I'll leave it to you if you decide you'd rather have a temporary for
'dev'.

> >
> > Sorry, I was referring to the series itself, not your feedback above. You
> > assigned this to yourself in patchwork, so I was just noting that this patch
> > series may be a candidate for fixes to 4.11, rather than testing/for-next for
> > 4.12. Your call.
> 
> Ah, thanks Darren for clarification.

I think this can easily wait for 4.12 if you are concerned about
regressions. i2c_adapter is large enough so we won't reference
unallocated memory and we only read from client->name so we should not
perturb anything if we actually are dealing with i2c_adapter, and the
data we'll read is unlikely to match to ACPI name we interested in.

The 2nd patch is mere optimization.

Thanks.

-- 
Dmitry
