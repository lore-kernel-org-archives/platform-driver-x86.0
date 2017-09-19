From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] mux: add mux_control_get_optional() API
Date: Tue, 19 Sep 2017 20:35:50 +0200
Message-ID: <258023e8-3f5c-6aef-3f46-a377f5b0bfb5@redhat.com>
References: <20170905164221.11266-6-hdegoede@redhat.com>
 <20170908154514.4463-1-peda@axentia.se>
 <20170908154514.4463-2-peda@axentia.se>
 <64cd3a6d-cf3e-89ed-0c26-65b395d18008@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50480 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751227AbdISSf4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 14:35:56 -0400
In-Reply-To: <64cd3a6d-cf3e-89ed-0c26-65b395d18008@axentia.se>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org

Hi,

On 09/08/2017 05:54 PM, Peter Rosin wrote:
> On 2017-09-08 17:45, Peter Rosin wrote:
>> From: Stephen Boyd <stephen.boyd@linaro.org>
>>
>> Sometimes drivers only use muxes under certain scenarios. For
>> example, the chipidea usb controller may be connected to a usb
>> switch on some platforms, and connected directly to a usb port on
>> others. The driver won't know one way or the other though, so add
>> a mux_control_get_optional() API that allows the driver to
>> differentiate errors getting the mux from there not being a mux
>> for the driver to use at all.
>> ---
>>   Documentation/driver-model/devres.txt |   1 +
>>   drivers/mux/core.c                    | 104 +++++++++++++++++++++++++++-------
>>   include/linux/mux/consumer.h          |   4 ++
>>   3 files changed, 89 insertions(+), 20 deletions(-)
>>
>> I haven't tested this patch, and hence I have not signed it and I also
>> removed the sign-off from Stephen...
> 
> Huh, I definitely intended to mention that this patch is based on [1]
> from Stephen, but that I've made changes according to the comments in
> that thread (and more). And those changes are what made me remove the
> sign-off from Stephen...

AFAIK normally a Signed-off-by is kept if some (small-ish) changes
are made. The S-o-b is mostly an indication that the author is
ok with adding the code to the kernel under the GPL.

Anyways, Stephen are you ok with re-adding your S-o-b to
the version modified by Peter?

Regards,

Hans
