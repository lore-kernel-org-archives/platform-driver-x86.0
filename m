From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH 2/2] IPS driver: verify BIOS provided limits
Date: Mon, 27 Sep 2010 10:38:39 -0700
Message-ID: <20100927103839.797fe6bb@jbarnes-desktop>
References: <1285278569-4368-1-git-send-email-jbarnes@virtuousgeek.org>
	<1285278569-4368-2-git-send-email-jbarnes@virtuousgeek.org>
	<20100923145301.77eaccca@jbarnes-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy2-pub.bluehost.com ([67.222.39.38]:50842 "HELO
	cpoproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1759882Ab0I0Rip (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Sep 2010 13:38:45 -0400
In-Reply-To: <20100923145301.77eaccca@jbarnes-desktop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: tim.gardner@canonical.com, platform-driver-x86@vger.kernel.org, mjg59@redhat.com

On Thu, 23 Sep 2010 14:53:01 -0700
Jesse Barnes <jbarnes@virtuousgeek.org> wrote:

> On Thu, 23 Sep 2010 23:49:29 +0200
> Jesse Barnes <jbarnes@virtuousgeek.org> wrote:
> 
> > They're optional.  If not present or sane, we should use the CPU
> > defaults.
> > 
> > Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
> > ---
> >  drivers/platform/x86/intel_ips.c |   23 +++++++++++++++++++++++
> >  1 files changed, 23 insertions(+), 0 deletions(-)
> 
> Note this patch is necessary but not sufficient.  At least on one of my
> test platforms, I see really bad looking chipset power values from the
> i915 driver.  That will trigger spurious "power exceeded" messages and
> unnecessarily limit your GPU performance.  Working on a fix now.

Already sent this fix to Chris for inclusion, but here it is for
reference and testing in this thread.

-- 
Jesse Barnes, Intel Open Source Technology Center

diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
index 9d67b48..c74e4e8 100644
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@ -1787,9 +1787,9 @@ unsigned long i915_chipset_val(struct drm_i915_private *dev_priv)
 		}
 	}
 
-	div_u64(diff, diff1);
+	diff = div_u64(diff, diff1);
 	ret = ((m * diff) + c);
-	div_u64(ret, 10);
+	ret = div_u64(ret, 10);
 
 	dev_priv->last_count1 = total_count;
 	dev_priv->last_time1 = now;
@@ -1858,7 +1858,7 @@ void i915_update_gfx_val(struct drm_i915_private *dev_priv)
 
 	/* More magic constants... */
 	diff = diff * 1181;
-	div_u64(diff, diffms * 10);
+	diff = div_u64(diff, diffms * 10);
 	dev_priv->gfx_power = diff;
 }
 
