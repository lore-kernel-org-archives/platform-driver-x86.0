From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 14:46:28 -0700
Message-ID: <20101007214628.GB18628@core.coreip.homeip.net>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
 <20101007111510.GA19624@srcf.ucam.org>
 <AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com>
 <20101007133529.GA21782@srcf.ucam.org>
 <AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com>
 <20101007205049.GB32726@srcf.ucam.org>
 <AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com>
 <20101007213027.GA18628@core.coreip.homeip.net>
 <20101007213754.GA1896@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101007213754.GA1896@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mario Limonciello <superm1@ubuntu.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 07, 2010 at 10:37:54PM +0100, Matthew Garrett wrote:
> On Thu, Oct 07, 2010 at 02:30:28PM -0700, Dmitry Torokhov wrote:
> 
> > We have this strategy for bunch of input stuff (force release, keymap)
> > and I think it works better than dding more and more DMI quirks into
> > kernel itself.
> 
> It's limited to Dell hardware, so I think keeping a static list in the 
> Dell laptop driver is reasonable. All we need is a list of hardware, and 
> I'd really hope that Dell know which BIOS versions contain this code!
> 

Unfortunately this kind of crap tends to flow from one BIOS version to
another.. How many DMI entries do we know about so far? Did Dell issue
firmware updates correcting the issue so new boxes will not exhibit the
problem?

-- 
Dmitry
