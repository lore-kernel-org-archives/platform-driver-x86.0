From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] platform: x86: dell-laptop: Add support for keyboard
 backlight
Date: Wed, 19 Nov 2014 19:23:36 +0000
Message-ID: <20141119192336.GA942@srcf.ucam.org>
References: <1415967813-7223-1-git-send-email-pali.rohar@gmail.com>
 <20141119183416.GA100640@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141119183416.GA100640@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, libsmbios-devel@lists.us.dell.com, Srinivas_G_Gowda@dell.com, Michael_E_Brown@dell.com, Gabriele Mazzotta <gabriele.mzt@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 19, 2014 at 10:34:16AM -0800, Darren Hart wrote:

> I'm somewhat concerned that this patch doubles the size of this driver. When
> we're adding this much code, I have to ask - does it make sense to grow this
> driver rather than create a new one?

There'd be a fair amount of code duplication in splitting it. 

> There is no ACPI backlight driver on these systems? We need a platform driver?

ACPI doesn't specify keyboard backlight control, so this ends up being 
very vendor specific.
 
-- 
Matthew Garrett | mjg59@srcf.ucam.org
