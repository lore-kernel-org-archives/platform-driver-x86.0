From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] dell-laptop: Fix keyboard led max_brightness property
 for Dell Latitude E6410
Date: Fri, 8 Dec 2017 13:41:24 -0800
Message-ID: <20171208214124.GA819@fury>
References: <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
 <1509654324-709-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1509654324-709-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 02, 2017 at 09:25:24PM +0100, Pali Rohár wrote:
> This machine reports number of keyboard backlight led levels, instead of
> value of the last led level index. Therefore max_brightness properly needs
> to be subtracted by 1 to match led max_brightness API.
> 
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913


Queued, thanks Pali (sorry for the delay).

-- 
Darren Hart
VMware Open Source Technology Center
