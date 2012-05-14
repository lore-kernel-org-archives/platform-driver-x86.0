From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: rfkill blacklist Dell XPS 13z, 15z
Date: Mon, 14 May 2012 22:19:59 +0100
Message-ID: <20120514211959.GA9394@srcf.ucam.org>
References: <1337023652-11661-1-git-send-email-kamal@canonical.com>
 <20120514193718.GA6438@srcf.ucam.org>
 <4FB16659.6040704@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FB16659.6040704@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: Kamal Mostafa <kamal@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 14, 2012 at 03:08:57PM -0500, Mario Limonciello wrote:
> 
> On 05/14/2012 02:37 PM, Matthew Garrett wrote:
> >What does "Improper BIOS interaction" mean? What's the proper BIOS interaction?
> These platforms are not obeying the smbios interface specs for turning on and off radios.  It's not currently expected that the interaction will improve during the lifetime of these platforms.  If it does, then this can be adjusted to only apply to the BIOS versions before the fix.

Ok, pretty bored of this at this point. If the bios interface is 
unreliable then I'll just remove the rfkill support. I'm not going to 
continue adding machines to a blacklist some time after users find 
things are broken.

Is this just as broken under Windows?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
