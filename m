From: Yu Chen <yu.c.chen@intel.com>
Subject: Re: [PATCH] [v2] surface pro 3: Add support driver for Surface Pro
 3 buttons
Date: Tue, 18 Aug 2015 09:42:31 +0800
Message-ID: <55D28D87.2080800@intel.com>
References: <1438934272-17959-1-git-send-email-yu.c.chen@intel.com> <1438936078.2322.29.camel@perches.com> <1438937513.2723.10.camel@localhost> <20150811024524.GA3095@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150811024524.GA3095@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "joe@perches.com" <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "jslaby@suse.com" <jslaby@suse.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "arnd@arndb.de" <arnd@arndb.de>
List-Id: platform-driver-x86.vger.kernel.org

On 08/11/2015 10:45 AM, Darren Hart wrote:
> On Fri, Aug 07, 2015 at 08:48:18AM +0000, Chen, Yu C wrote:
>> On Fri, 2015-08-07 at 01:27 -0700, Joe Perches wrote:
>>> On Fri, 2015-08-07 at 15:57 +0800, Chen Yu wrote:					\
>>>
>>> I think the older switch/case was easier to understand.
>>>
>> OK, then let's keep the switch/case.
>> thanks.
>
> Agreed.
>
Hi, Darren and Joe, I'll send a V4 of this patch to
add a method to exclude the load of Surface 3(no Pro),
since Surface 3 also has a device name of MSHW0028, but
it is not used for buttons.
Thanks

Best Regards,
Yu
>
