From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: rfkill blacklist Dell XPS 13z, 15z
Date: Mon, 14 May 2012 20:37:18 +0100
Message-ID: <20120514193718.GA6438@srcf.ucam.org>
References: <1337023652-11661-1-git-send-email-kamal@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:35087 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757653Ab2ENThV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 May 2012 15:37:21 -0400
Content-Disposition: inline
In-Reply-To: <1337023652-11661-1-git-send-email-kamal@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kamal Mostafa <kamal@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

On Mon, May 14, 2012 at 12:27:32PM -0700, Kamal Mostafa wrote:
> From: Mario Limonciello <mario_limonciello@dell.com>
> 
> On Dell XPS 13z (L321X) and 15z (L502X), switching off Bluetooth also
> disables wifi due to improper improper BIOS interaction with dell-laptop.
> Add those models to the rfkill blacklist.

What does "Improper BIOS interaction" mean? What's the proper BIOS 
interaction?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
