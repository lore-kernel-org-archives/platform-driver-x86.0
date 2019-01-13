From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-hid: Missing power button release on
 some Dell models
Date: Sat, 12 Jan 2019 20:15:32 -0800
Message-ID: <20190113041532.GB1349@wrath>
References: <20190106175644.24872-1-jerome.debretagne@gmail.com>
 <057ab73bef634b4f8c474924eb6db572@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <057ab73bef634b4f8c474924eb6db572@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: jerome.debretagne@gmail.com, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, andy@infradead.org, rjw@rjwysocki.net, cwhuang@android-x86.org, tristian.celestin@outlook.com, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 07, 2019 at 03:36:48PM +0000, Mario.Limonciello@dell.com wrote:
> 
> 
> > -----Original Message-----
> > From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> > owner@vger.kernel.org> On Behalf Of Jérôme de Bretagne
> > Sent: Sunday, January 6, 2019 11:57 AM
> > To: Alex Hung
> > Cc: platform-driver-x86@vger.kernel.org; Andy Shevchenko; Darren Hart;
> > Limonciello, Mario; Rafael J. Wysocki; Chih-Wei Huang; Tristian Celestin; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH] platform/x86: intel-hid: Missing power button release on some
> > Dell models
> > 
> > 
> > [EXTERNAL EMAIL]
> > 
> > Power button suspend for some Dell models was added in:
> > 
> > commit 821b85366284 (intel-hid: Power button suspend on Dell Latitude 7275)

I've addressed this one, but please do run checkpatch and correct reported
errors in the future. It checks commit reference format.

> > 
> > by checking against the power button press notification (0xCE) to report
> > the power button press event. The corresponding power button release
> > notification (0xCF) was caught and ignored to stop it from being reported
> > as an "unknown event" in the logs.
> > 
> > The missing button release event is creating issues on Android-x86, as
> > reported on the project mailing list for a Dell Latitude 5175 model, since
> > the events are expected in down/up pairs.
> > 
> > Report the power button release event to fix this issue.
> > 
> > Link: https://groups.google.com/forum/#!topic/android-x86/aSwZK9Nf9Ro
> > Tested-by: Tristian Celestin <tristian.celestin@outlook.com>
> > Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Queued for testing, thanks for the patch.

-- 
Darren Hart
VMware Open Source Technology Center
