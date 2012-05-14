From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH] dell-laptop: rfkill blacklist Dell XPS 13z, 15z
Date: Mon, 14 May 2012 15:08:57 -0500
Message-ID: <4FB16659.6040704@dell.com>
References: <1337023652-11661-1-git-send-email-kamal@canonical.com> <20120514193718.GA6438@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120514193718.GA6438@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Kamal Mostafa <kamal@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


On 05/14/2012 02:37 PM, Matthew Garrett wrote:
> What does "Improper BIOS interaction" mean? What's the proper BIOS interaction?
These platforms are not obeying the smbios interface specs for turning on and off radios.  It's not currently expected that the interaction will improve during the lifetime of these platforms.  If it does, then this can be adjusted to only apply to the BIOS versions before the fix.

-- 
*Mario Limonciello*
Linux Engineer
*Dell*| OS Engineering
