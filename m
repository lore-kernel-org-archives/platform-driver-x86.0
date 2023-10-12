Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AC5CDB46E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Oct 2023 12:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343882AbjJLM5C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Oct 2023 08:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343872AbjJLM5B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2023 08:57:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A59BBE
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697115417; x=1728651417;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tvSxIXKIgWwFIB4Dsiy1nOTZnpGDjl+jiYdN79co2Pk=;
  b=JGLx+VnU4paWGKmHBLZbAsDGFrhDIFoEhy8uKsy830aKV9w7iTjqvJjm
   QiA6lcPURbr/fkbPUI85O/U4py32w2pgvBoRm+ATvwCNz1M+s3ttwKN/w
   lVX3J5wDb68vbXSOmfc74FkzZKjwov1GbLFOuZBQH/+x3IYKtCzv7sBx4
   ojAwu7X0MFhwgvzV3eFD67HK+/hQWllwxTdUc3QhlYDd/11VDi3crQv2y
   +chOhi7nSfdKEJyGKJGWn6I0fltvtdgI946jfAGydVVTEzM4s/SGFcdEj
   wrtJ3CnfcQQkAB2v8vjD0Md7ARA3oNtMWa4zBNlbvpoQIgl9SM2wLD/pT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6459682"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="6459682"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 05:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754233548"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="754233548"
Received: from asroczyn-mobl.ger.corp.intel.com ([10.249.36.107])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 05:56:55 -0700
Date:   Thu, 12 Oct 2023 15:56:52 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Nikita Kravets <teackot@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH 2/5] platform/x86: msi-ec: Add fw version and release
 date attributes
In-Reply-To: <c447f107-df52-92d1-fdd3-96b76860621e@redhat.com>
Message-ID: <72d7f17d-25a6-dc6-453a-af553ae2349@linux.intel.com>
References: <20231010172037.611063-3-teackot@gmail.com> <20231010172037.611063-7-teackot@gmail.com> <974c5-8032-28e0-fd2f-9fbc9d413e4b@linux.intel.com> <c447f107-df52-92d1-fdd3-96b76860621e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1562055149-1697115416=:1692"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1562055149-1697115416=:1692
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Hans,

You missed the one question I had for you. I put it now conviniently at 
the end of the quote block below...

On Thu, 12 Oct 2023, Hans de Goede wrote:
> 
> Great to see that you are working on upstreaming more of the
> out-of-tree msi-ec functionality. Thank you for working on this.
> 
> On 10/11/23 14:41, Ilpo Järvinen wrote:
> > On Tue, 10 Oct 2023, Nikita Kravets wrote:
> > 
> >> Create a root attribute group and add the first platform device
> >> attributes: firmware version and firmware release date. Firmware
> >> version attribute uses an already present ec_get_firmware_version()
> >> function. Both features are present on all supported laptops.
> >>
> >> Cc: Aakash Singh <mail@singhaakash.dev>
> >> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> >> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> >> ---

> >> +static ssize_t fw_release_date_show(struct device *device,
> >> +				    struct device_attribute *attr, char *buf)
> >> +{
> >> +	u8 rdate[MSI_EC_FW_DATE_LENGTH + 1];
> >> +	u8 rtime[MSI_EC_FW_TIME_LENGTH + 1];
> >> +	int result;
> >> +	int year, month, day, hour, minute, second;
> >> +
> >> +	memset(rdate, 0, MSI_EC_FW_DATE_LENGTH + 1);
> > 
> > sizeof(*rdate) is safer so please use it.
> > 
> >> +	result = ec_read_seq(MSI_EC_FW_DATE_ADDRESS,
> >> +			     rdate,
> >> +			     MSI_EC_FW_DATE_LENGTH);
> >> +	if (result < 0)
> >> +		return result;
> >> +
> >> +	result = sscanf(rdate, "%02d%02d%04d", &month, &day, &year);
> > 
> > There fields would naturally be %u and unsigned but see the other comment 
> > below before doing this change.
> > 
> >> +	if (result != 3)
> >> +		return -EINVAL;
> > 
> > EINVAL should be returned if the input was invalid but here the data 
> > itself is not okay so some other errno would be better.
> > 
> >> +	memset(rtime, 0, MSI_EC_FW_TIME_LENGTH + 1);
> > 
> > sizeof() like above.
> > 
> >> +	result = ec_read_seq(MSI_EC_FW_TIME_ADDRESS,
> >> +			     rtime,
> >> +			     MSI_EC_FW_TIME_LENGTH);
> >> +	if (result < 0)
> >> +		return result;
> >> +
> >> +	result = sscanf(rtime, "%02d:%02d:%02d", &hour, &minute, &second);
> >> +	if (result != 3)
> >> +		return -EINVAL;
> > 
> > Ditto.
> > 
> >> +
> >> +	return sysfs_emit(buf, "%04d/%02d/%02d %02d:%02d:%02d\n", year, month, day,
> >> +			  hour, minute, second);
> > 
> > It would be kind of nice to use %pt formatting here instead of custom
> > datetime format, however, it would either require converting to time64_t 
> > or using struct rtc_time. The latter would naturally have the right fields 
> > but they're not unsigned so my comment above about %u is not going to work 
> > well with it.
> > 
> > I'm also a bit unsure whether it's appropriate to use that struct outside 
> > of rtc realm. vsprintf.c seems to convert time64_t into rtc_time before 
> > printing though.
> > 
> > Hans, do you have any idea about the struct rtc_time?



-- 
 i.

--8323329-1562055149-1697115416=:1692--
