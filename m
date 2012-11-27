From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: A weird rfkill problem after rebooting the system
Date: Tue, 27 Nov 2012 09:28:21 +0100
Message-ID: <1354004901.9576.4.camel@jlt4.sipsolutions.net>
References: <CAMz9Wg8y3JaJiEhsOz94viqpC4XXhQeE-eruBUGkXdY78-G=4A@mail.gmail.com>
	 (sfid-20121127_073525_960060_6A8BC0D2)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMz9Wg8y3JaJiEhsOz94viqpC4XXhQeE-eruBUGkXdY78-G=4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (sfid-20121127_073525_960060_6A8BC0D2)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: AceLan Kao <acelan.kao-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Alan Jenkins <alan-jenkins-cCz0Lq7MMjm9FHfhHBbuYA@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2012-11-27 at 14:35 +0800, AceLan Kao wrote:
> Hi,
> 
> I encountered a strange rfkill problem on the ASUS laptop.
> But it's more like an rfkill issue to me, so I mail to the
> linux-wireless mailing list and
> CC'd to the maintainer of the asus-wmi driver.

This totally sounds like a platform driver issue, adding that mailing
list (left full text intact below). Nothing I can help you with.

johannes

> I attached 2 rfkill event log files.
> 1. The first one(rfkill.0.log) is the driver we use currently,
> you can see that I can soft block/unblock the devices by hitting the hotkey.
> But the behavior is abnormal if I reboot the system with the devices blocked.
> They are blocked after reboot is as expected.
> But while I'm trying to unblock them, the phy0(the one keeps changing
> its index) will become blocked.
> So, there is no way to unblock the bt device by hitting hotkey.
> 
> 2. The second log file is I try to remove the line from asus-wmi.c
>    rfkill_init_sw_state(*rfkill, !result);
> Then, it works after rebooting.
> I suspect the problem comes from the line in rfkill_init_sw_state() function
>    rfkill->persistent = true;
> While calling rfkill_register() with persistent is false, then it'll
> call rfkill_sync_work()
> to set device block state, so that it prevents this issue.
> But I'm not sure if my guess is correct and have no idea why it
> doesn't need to this if persistent is true.
> The persistent value seems doesn't affect the rfkill state that much
> after reboot, the rfkill state is correct all the time.
> 
> BTW, the BIOS of this ASUS machine doesn't set the rfkill state while
> we hit the hotkey.
> 
> Best regards,
> AceLan Kao.
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
