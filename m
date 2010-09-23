From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH 2/2] IPS driver: verify BIOS provided limits
Date: Thu, 23 Sep 2010 14:53:01 -0700
Message-ID: <20100923145301.77eaccca@jbarnes-desktop>
References: <1285278569-4368-1-git-send-email-jbarnes@virtuousgeek.org>
	<1285278569-4368-2-git-send-email-jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy1-pub.bluehost.com ([69.89.21.11]:45100 "HELO
	cpoproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755224Ab0IWVxE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Sep 2010 17:53:04 -0400
In-Reply-To: <1285278569-4368-2-git-send-email-jbarnes@virtuousgeek.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: tim.gardner@canonical.com, platform-driver-x86@vger.kernel.org
Cc: mjg59@redhat.com

On Thu, 23 Sep 2010 23:49:29 +0200
Jesse Barnes <jbarnes@virtuousgeek.org> wrote:

> They're optional.  If not present or sane, we should use the CPU
> defaults.
> 
> Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
> ---
>  drivers/platform/x86/intel_ips.c |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)

Note this patch is necessary but not sufficient.  At least on one of my
test platforms, I see really bad looking chipset power values from the
i915 driver.  That will trigger spurious "power exceeded" messages and
unnecessarily limit your GPU performance.  Working on a fix now.

-- 
Jesse Barnes, Intel Open Source Technology Center
