From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 12/22] fjes: net_device_ops.ndo_get_stats64
Date: Thu, 18 Jun 2015 17:00:52 +0300
Message-ID: <5582CF14.3040507@cogentembedded.com>
References: <1434588359-25589-1-git-send-email-izumi.taku@jp.fujitsu.com> <1434588587-25655-1-git-send-email-izumi.taku@jp.fujitsu.com> <1434588587-25655-12-git-send-email-izumi.taku@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:36573 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755303AbbFROAz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Jun 2015 10:00:55 -0400
Received: by lacny3 with SMTP id ny3so55002135lac.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Jun 2015 07:00:54 -0700 (PDT)
In-Reply-To: <1434588587-25655-12-git-send-email-izumi.taku@jp.fujitsu.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Taku Izumi <izumi.taku@jp.fujitsu.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Cc: rkhan@redhat.com, alexander.h.duyck@redhat.com, netdev@vger.kernel.org, linux-acpi@vger.kernel.org

Hello.

On 6/18/2015 3:49 AM, Taku Izumi wrote:

> This patch adds net_device_ops.ndo_get_stats64 callback.

> Signed-off-by: Taku Izumi <izumi.taku@jp.fujitsu.com>
> ---
>   drivers/platform/x86/fjes/fjes_main.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

> diff --git a/drivers/platform/x86/fjes/fjes_main.c b/drivers/platform/x86/fjes/fjes_main.c
> index 97bf487..eeda824 100644
> --- a/drivers/platform/x86/fjes/fjes_main.c
> +++ b/drivers/platform/x86/fjes/fjes_main.c
> @@ -57,6 +57,8 @@ static netdev_tx_t fjes_xmit_frame(struct sk_buff *,
>   static void fjes_raise_intr_rxdata_task(struct work_struct *);
>   static void fjes_tx_stall_task(struct work_struct *);
>   static irqreturn_t fjes_intr(int, void*);
> +static struct rtnl_link_stats64
> +*fjes_get_stats64(struct net_device *, struct rtnl_link_stats64 *);

    I'd leave * on the first line, otherwise it looks quite ugly..

[...]
> @@ -734,6 +737,17 @@ static netdev_tx_t fjes_xmit_frame(struct sk_buff *skb,
>   	return ret;
>   }
>
> +static struct rtnl_link_stats64
> +*fjes_get_stats64(struct net_device *netdev,

    Same here.

[...]

WBR, Sergei
