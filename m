From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Revert:
 "dell-laptop: Toggle the unsupported hardware killswitch"
Date: Wed, 6 Jul 2011 15:50:03 -0700
Message-ID: <20110706155003.17090951.akpm@linux-foundation.org>
References: <1309169943-3786-1-git-send-email-kengyu@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:44609 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751928Ab1GFWuS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jul 2011 18:50:18 -0400
In-Reply-To: <1309169943-3786-1-git-send-email-kengyu@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Keng-Yu Lin <kengyu@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, gmane@colin.guthr.ie, Alessio Igor Bogani <abogani@texware.it>, stable@kernel.org

On Mon, 27 Jun 2011 11:19:03 +0100
Keng-Yu Lin <kengyu@canonical.com> wrote:

> This reverts commit a3d77411e8b2ad661958c1fbee65beb476ec6d70,
> 
> as it causes a mess in the wireless rfkill status on some models.
> It is probably a bad idea to toggle the rfkill for all dell models
> without the respect to the claim that it is hardware-controlled.
> 

If we're reverting this from mainline then we should also revert it
from 2.6.38.x and 2.6.39.x, no?
