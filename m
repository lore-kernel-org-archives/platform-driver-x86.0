From: Joseph Salisbury <joseph.salisbury@canonical.com>
Subject: Re: [PATCH 1/1] intel_ips: blacklist ASUSTek G60JX laptops
Date: Thu, 29 Aug 2013 12:18:14 -0400
Message-ID: <521F7446.7060002@canonical.com>
References: <cover.1376494861.git.joseph.salisbury@canonical.com> <d4635f76028172e872cc4be506bad1c11816f75a.1376494861.git.joseph.salisbury@canonical.com> <20130814093836.57002b77@jbarnes-desktop> <CA+55aFy09OfUb_ENi6NgVWaNM7YBvLovcf5FvyHfpXXBUGsQkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:44378 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754243Ab3H2QS1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Aug 2013 12:18:27 -0400
In-Reply-To: <CA+55aFy09OfUb_ENi6NgVWaNM7YBvLovcf5FvyHfpXXBUGsQkg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>

On 08/14/2013 05:11 PM, Linus Torvalds wrote:
> On Wed, Aug 14, 2013 at 9:38 AM, Jesse Barnes <jbarnes@virtuousgeek.org> wrote:
>> Linus, you may want to pick this up directly, as I'm not sure if
>> Matthew is still looking after the x86 drivers these days.
> Can't we make the simpler patch be to just not spam the logs? Do it
> once, and forget about it. Maybe make the timeouts long enough to make
> sure that there are no other downsides from having the driver
> occasionally testing if it's back?
>
> I *detest* hardware-specific blacklists. They are impossible to
> maintain, and we've had the situation more than once that we fixed the
> real bug that caused the blacklist in the first place, but the entry
> stays around because nobody knows/cares/tests it.
>
>                   Linus
Hi Jesse,

What are your thoughts on alternatives to using a blacklist?  Is there a
bit we can read to determine if IPS is supported on a platform?

If not, can we do something like the following?  Basically increase the
timeout to 30 seconds then return an error from the monitor if there was
no update in that time:

diff --git a/drivers/platform/x86/intel_ips.c
b/drivers/platform/x86/intel_ips.c
index 18dcb58..a2391f7 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1095,8 +1095,15 @@ static int ips_monitor(void *data)
                cur_seqno = (thm_readl(THM_ITV) & ITV_ME_SEQNO_MASK) >>
                        ITV_ME_SEQNO_SHIFT;
                if (cur_seqno == last_seqno &&
-                   time_after(jiffies, seqno_timestamp + HZ)) {
-                       dev_warn(&ips->dev->dev, "ME failed to update
for more than 1s, likely hung\n");
+                   time_after(jiffies, seqno_timestamp + (HZ*30))) {
+                       /* It's been 30s.  ME is likely hung.  Print
message and return. */
+                       dev_warn(&ips->dev->dev, "ME failed to update
for more than 30s, likely hung so exiting\n");
+                       del_timer_sync(&timer);
+                       destroy_timer_on_stack(&timer);
+
+                       dev_dbg(&ips->dev->dev, "ips-monitor thread
stopped\n");
+                       return -1;
+
                } else {
                        seqno_timestamp = get_jiffies_64();
                        last_seqno = cur_seqno;

There may be more to include such as restarting the monitor later to see
if the ME ever came back, just looking for other ideas and/or suggestions.

Thanks,

Joe
