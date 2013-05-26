From: Daniel Serpell <daniel.serpell@gmail.com>
Subject: Re: [PATCH] sony-laptop: Reading gfx_switch_status in SVS13A15GLB
Date: Sun, 26 May 2013 19:37:45 -0400
Message-ID: <20130526233725.GA22177@daniel-vaio>
References: <CANepG=Ot72gY8qacyTvte1oGO8ymEj69xgrvdKg1Q8McMddKLw@mail.gmail.com>
 <20130526221607.GA9539@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:64348 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755447Ab3EZXhw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 26 May 2013 19:37:52 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb11so4789231pad.23
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 May 2013 16:37:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130526221607.GA9539@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Arthur Wirski <awirski@gmail.com>, platform-driver-x86@vger.kernel.org

On Mon, May 27, 2013 at 07:16:07AM +0900, Mattia Dongili wrote:
> On Sat, May 25, 2013 at 08:12:43PM -0400, Daniel Serpell wrote:
> > 
> > Attached is a patch to fix this.
> 
> oh, nice. we've been reporting the opposite for all this time... And it
> looks like we're missing the AUTO value of the enum when setting the
> buffer.
> Mind adding that and resending the patch (as inline attachment)?
> 

Ok, I'm not sure what is the preferred style, but here is the new patch.
I can't test the "AUTO" setting, as this laptop has only two positions.

Thanks,

    Daniel.

From: Daniel Serpell <daniel.serpell@gmail.com>
Date: Sun, 26 May 2013 19:16:18 -0400
Subject: [PATCH] Fix reporting of sony-laptop gfx_switch_status.

Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>
---
 drivers/platform/x86/sony-laptop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index a10a376..3503d9c 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2440,7 +2440,10 @@ static ssize_t sony_nc_gfx_switch_status_show(struct device *dev,
 	if (pos < 0)
 		return pos;
 
-	return snprintf(buffer, PAGE_SIZE, "%s\n", pos ? "speed" : "stamina");
+	return snprintf(buffer, PAGE_SIZE, "%s\n",
+					pos == SPEED ? "speed" :
+					pos == STAMINA ? "stamina" :
+					pos == AUTO ? "auto" : "unknown" );
 }
 
 static int sony_nc_gfx_switch_setup(struct platform_device *pd,
-- 
1.8.1.2
