From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/3] driver: provide sysfs interfaces to access TXT
 config space
Date: Fri, 17 May 2013 20:07:35 +0200
Message-ID: <20130517180735.GA11631@amd.pavel.ucw.cz>
References: <1368465884-14779-1-git-send-email-qiaowei.ren@intel.com>
 <1368465884-14779-3-git-send-email-qiaowei.ren@intel.com>
 <20130516160311.GA12299@amd.pavel.ucw.cz>
 <9E0BE1322F2F2246BD820DA9FC397ADE0135DF81@SHSMSX102.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9E0BE1322F2F2246BD820DA9FC397ADE0135DF81@SHSMSX102.ccr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ren, Qiaowei" <qiaowei.ren@intel.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Wei, Gang" <gang.wei@intel.com>, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri 2013-05-17 08:50:11, Ren, Qiaowei wrote:
> On 2013-05-17, Pavel Machek wrote:
> > On Tue 2013-05-14 01:24:43, Qiaowei Ren wrote:
> >> +What:		/sys/devices/platform/intel_txt/config/STS_raw +Date:		May 2013
> >> +KernelVersion:	3.9 +Contact:	"Qiaowei Ren" <qiaowei.ren@intel.com>
> >> +Description:	TXT.STS is the general status register. This read-only
> >> register +		is used by AC modules and the MLE to get the status of
> >> various +		Intel TXT features.
> > 
> > This is not enough to allow people to understand what this does/should
> > do, nor does it allow (for example) ARM people to implement something compatible.
> 
> Currently TXT is only a technology for safer computing provided by Intel. I am absolutely not sure whether similar technology will be provided on ARM or other platform in future. But I guess I don't have to consider those future possible implementation on ARM or other platform. :)
> 

You still have to properly design the interface and properly document
it, so people can understand and test it, and develop compatible
implementations.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
