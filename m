From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [RFC v5 4/8] platform: x86: Add generic Intel IPC driver
Date: Mon, 9 Oct 2017 23:27:45 -0700
Message-ID: <20171010062745.GA31945@infradead.org>
References: <cover.1507414288.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <983bc2330acc5eb3f384e9aed7ceba22b5c7ea5f.1507414288.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <5F7315E704FA0841B5DFCE90329B2BB4661E20EC@BGSMSX102.gar.corp.intel.com>
 <20171009071104.GA17088@infradead.org>
 <0f54e44a-5ba0-ed0f-7efe-eff05e8b79d8@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0f54e44a-5ba0-ed0f-7efe-eff05e8b79d8-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sathyanarayanan kuppuswamy <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Chakravarty, Souvik K" <souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Zha, Qipeng" <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 09, 2017 at 05:27:21PM -0700, sathyanarayanan kuppuswamy wrote:
> Hi,
> 
> 
> On 10/09/2017 12:11 AM, Christoph Hellwig wrote:
> > What does IPC stand for in this device?
> Inter processor communication

Id would suggest to explain that, as it's not how we usually use the
term in Linux?
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
