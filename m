From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi - do not treat all devices
 as i2c_clients
Date: Tue, 4 Apr 2017 19:08:28 +0300
Message-ID: <CAHp75VezdB1PmNUfUzCCKVP7pswkVKJRvLHaAtMJ-W17-Rf3fw@mail.gmail.com>
References: <20170404032514.31832-1-dmitry.torokhov@gmail.com>
 <CAHp75Vc62q7a+0CS3S9TNm+CVPodqG6HT9yoq0d8RBQ0B72REw@mail.gmail.com> <20170404160540.GD5936@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35293 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754230AbdDDQIa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 12:08:30 -0400
In-Reply-To: <20170404160540.GD5936@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 4, 2017 at 7:05 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Apr 04, 2017 at 04:45:05PM +0300, Andy Shevchenko wrote:
>> On Tue, Apr 4, 2017 at 6:25 AM, Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>> > I2C bus has both i2c clients and adapter devices, so we must be careful in
>> > notifier code and verify that we are actually dealing with an i2c client
>> > before using it as such.
>>
>> > -static void silead_ts_dmi_add_props(struct device *dev)
>> > +static void silead_ts_dmi_add_props(struct i2c_client *client)
>> >  {
>>
>> > -       struct i2c_client *client = to_i2c_client(dev);
>>
>> I would replace this by
>> struct device *dev = &client->dev;
>>
>> Otherwise looks good for me.
>
> Andy, this series looks like a candidate for 4.11-fixes. We're already at rc5
> though, so if we are going to do that, I'd like to see a stronger statement in
> the commit log about how this issue manifests currently - if it does.

It makes less changes for any (potentially) backported code.
I'm not insisting and even can do myself.

-- 
With Best Regards,
Andy Shevchenko
