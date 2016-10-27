From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [patch v1 1/2] drivers/platform/x86: move module mlx-platform
 from arch/x86 to drivers/platform/x86
Date: Thu, 27 Oct 2016 18:38:01 +0300
Message-ID: <1477582681.5295.33.camel@linux.intel.com>
References: <1477576758-102003-1-git-send-email-vadimp@mellanox.com>
         <1477576750.5295.28.camel@linux.intel.com>
         <AM5PR0501MB20974BD5E2B376806B8F031FA2AA0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:47944 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1031044AbcJ0PiH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2016 11:38:07 -0400
In-Reply-To: <AM5PR0501MB20974BD5E2B376806B8F031FA2AA0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "fengguang.wu@intel.com" <fengguang.wu@intel.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

On Thu, 2016-10-27 at 15:26 +0000, Vadim Pasternak wrote:
> > -----Original Message-----
> > From: Andy Shevchenko [mailto:andriy.shevchenko@linux.intel.com]
> > Sent: Thursday, October 27, 2016 4:59 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>; dvhart@infradead.org;
> > fengguang.wu@intel.com
> > Cc: davem@davemloft.net; geert@linux-m68k.org; akpm@linux-
> > foundation.org; kvalo@codeaurora.org; gregkh@linuxfoundation.org;
> > mchehab@kernel.org; linux@roeck-us.net; linux-kernel@vger.kernel.org
> > ;
> > platform-driver-x86@vger.kernel.org; jiri@resnulli.us
> > Subject: Re: [patch v1 1/2] drivers/platform/x86: move module mlx-
> > platform
> > from arch/x86 to drivers/platform/x86
> > 
> > On Thu, 2016-10-27 at 13:59 +0000, vadimp@mellanox.com wrote:
> > > From: Vadim Pasternak <vadimp@mellanox.com>
> > > 
> > > Move module mlx-platform.c from arch/x86/platform/mellanox/ to
> > > drivers/platform/x86/.
> > > Remove folder arch/x86/platform/mellanox/ and update relevant
> > > Makefile
> > > and Kconfig.
> > 
> > No way, please use -M -C.
> > 
> 
> 
> Hi Andy,
> 
> I am afraid I didn't understand your comment.
> Could you, please, add some more details?

When you prepare patches where files are copied and/or moved add those
command line options. It is the case for this patch.

Moreover I forgot to mention -n (link your patches into an e-mail
thread) if you consider them dependent.

More details are available in help of git format-patch.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
