Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C3EE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 11:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbjJIL2v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbjJIL2l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 07:28:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081BC1FC1
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696850862; x=1728386862;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=txAh2Mbyqw0LN/BVxDIyEgYu0BQe0DHz4PqbhNACgAs=;
  b=jvHoTcbrcN0B5qcAwS9bPliyneOxJlD27bV8uhPVFrQAiJ/OOC92ygZe
   fmfPCjY32jmJr6SfkwCoNXkD/rq8NT3tfgcQGA/INNBFhiJVmrzt9GIHE
   WNZxLlVrEcUroUZkg70kYgKfHzZm4syIEpGXFA86Lx0AEQVRfEkQ5LCFX
   alX29uFHxscTGOn3W9tYaghvoctnisZCpF9Suby0Rw8BQP+CP6TY19Bi8
   upNS7jcYnaH5YdsKa43Z0iSs2TBLSWFMgTUzZG/ulCD+X8wbQBrtXzRdk
   XcPCBI6qZpigt2EnGB08cVHE6Ofgz5fffYhpp7lI+3fmBHRpHCN44LJ4g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381385469"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="381385469"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="926730504"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="926730504"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:27:40 -0700
Date:   Mon, 9 Oct 2023 14:27:38 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH v2 1/3] platform/x86: msi-ec: Fix the 3rd config
In-Reply-To: <20231006175352.1753017-5-teackot@gmail.com>
Message-ID: <f3cc591-c171-1c74-9c29-de40e54de890@linux.intel.com>
References: <20231006175352.1753017-3-teackot@gmail.com> <20231006175352.1753017-5-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-4112260-1696850862=:1721"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-4112260-1696850862=:1721
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 6 Oct 2023, Nikita Kravets wrote:

> Fix the charge control address of CONF3 and remove an incorrect firmware
> version which turned out to be a BIOS firmware and not an EC firmware.
> 
> Fixes: 392cacf2aa10 ("platform/x86: Add new msi-ec driver")
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index f26a3121092f..492eb383ee7a 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -276,14 +276,13 @@ static struct msi_ec_conf CONF2 __initdata = {
>  
>  static const char * const ALLOWED_FW_3[] __initconst = {
>  	"1592EMS1.111",
> -	"E1592IMS.10C",
>  	NULL
>  };
>  
>  static struct msi_ec_conf CONF3 __initdata = {
>  	.allowed_fw = ALLOWED_FW_3,
>  	.charge_control = {
> -		.address      = 0xef,
> +		.address      = 0xd7,
>  		.offset_start = 0x8a,
>  		.offset_end   = 0x80,
>  		.range_min    = 0x8a,

Thanks.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-4112260-1696850862=:1721--
