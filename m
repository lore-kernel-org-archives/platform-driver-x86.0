From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/3] ideapad: Add nodes in sysfs
Date: Fri, 3 Jun 2011 13:21:41 -0700
Message-ID: <201106031321.42168.dmitry.torokhov@gmail.com>
References: <1307006553-12667-1-git-send-email-ike.pan@canonical.com> <1307006645-12702-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1307006645-12702-1-git-send-email-ike.pan@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>
List-Id: platform-driver-x86.vger.kernel.org

On Thursday, June 02, 2011 02:24:05 AM Ike Panhc wrote:
> +What:          /sys/devices/platform/ideapad/touchpad
> +Date:          Jun 2011
> +KernelVersion: 3.0.1
> +Contact:       "Ike Panhc <ike.pan@canonical.com>"
> +Description:
> +               Control the power of touchpad. 1 means on, 0 means off.

I do not think that we should be adding attributes like this one.
Is there any way to pug it into device core/PM infrastructure?

Also, what is the driver for having this attribute? Is it power savings
or is it because some people prefer to turn off the touchpad because
it interferes with typing?

Thanks.

-- 
Dmitry
