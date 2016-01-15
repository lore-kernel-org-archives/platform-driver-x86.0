From: "Chen, Yu C" <yu.c.chen@intel.com>
Subject: RE: [PATCH v4] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Fri, 15 Jan 2016 01:50:14 +0000
Message-ID: <36DF59CE26D8EE47B0655C516E9CE640286BCD1A@shsmsx102.ccr.corp.intel.com>
References: <1451244080-940-1-git-send-email-wengxt@gmail.com>
 <1452627835-20806-1-git-send-email-wengxt@gmail.com>
 <20160114230100.GF1989@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160114230100.GF1989@malice.jf.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Weng Xuetian <wengxt@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren, Xuetian

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, January 15, 2016 7:01 AM
> To: Weng Xuetian
> Cc: Chen, Yu C; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org
> Subject: Re: [PATCH v4] surface pro 4: Add support for Surface Pro 4 Buttons
> 
> On Tue, Jan 12, 2016 at 11:43:55AM -0800, Weng Xuetian wrote:
> > Surface Pro 4 buttons are managed by a device with _HID "MSHW0040"
> > different from Surface Pro 3.
> >
> > This commit adds MSHW0040 to id list to support the Surface Pro 4.
> >
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=109871
> > Signed-off-by: Weng Xuetian <wengxt@gmail.com>
> 
> This is so much better, thank you Weng.
> 
> Yu, are you happy with this version?
> 
One minor nit below, other than that,
Acked-by: Chen Yu <yu.c.chen@intel.com> 

-- #define SURFACE_BUTTON_DEVICE_NAME      "Surface Pro 3 Buttons"
++ #define SURFACE_BUTTON_DEVICE_NAME      "Surface Pro 3/4 Buttons"

And  
