Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B78DE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346619AbjJIPtu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344542AbjJIPtt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:49:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3659E
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696866588; x=1728402588;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=u2Rhft1ePYTZ57bG8psMEql++MMUMYWCc43ileCBudo=;
  b=Khf5xvDanNeDjaAyIDRv/+geQPp6d+s5CNOsyAkBX7b6X8xTwV6fHtCV
   7vJousX/yxcJdAg1CwpXe4o5JZwOLeYGjRmx7E4xmFGSNxB6t4J/6VgRh
   EMs3IIjkyNAIeJqHk46E+aqivf231N3SIhi2jwKYYDGlmRckRMMmpiNBq
   TRVSuJX5VerUVntozIFeLLxCPj9v7Ov2ZWuzlL3i5/WsPsgDiG90+yRXK
   q5Eh24Vaa5goLwqHt51XhYqxYo32fVo/PLi+JUoK5ZeQ2bOPkRYf3ZT8D
   JMA5p87NR7488wzP8Ac7oGxq29byPE+A66PE/TFAN5qXWzoe0nbKn6Im0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448364786"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="448364786"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788216898"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="788216898"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:49:11 -0700
Date:   Mon, 9 Oct 2023 18:49:09 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Move structures to pmc
 header
In-Reply-To: <d958b8e8-0a09-4449-ab6e-7eaf2d34ecd3@amd.com>
Message-ID: <51a3d6d-99e-73ce-5614-1fd77c821fb@linux.intel.com>
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com> <20231009144748.24054-2-Shyam-sundar.S-k@amd.com> <95a0ef77-ea2-a698-9ba7-3049195c7481@linux.intel.com> <d958b8e8-0a09-4449-ab6e-7eaf2d34ecd3@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1588588347-1696866553=:1721"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1588588347-1696866553=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:

> 
> 
> On 10/9/2023 9:09 PM, Ilpo Järvinen wrote:
> > On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> > 
> >> As we have a separate header for amd_pmc driver, move the common strutures,
> >> enums, and macros to the header file.
> >>
> >> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> > 
> >> +#define RESPONSE_REGISTER_LOOP_MAX	20000
> > 
> > This is borderline, I'd add prefix for this.
> > 
> >> +#define DELAY_MIN_US		2000
> >> +#define DELAY_MAX_US		3000
> >> +#define FIFO_SIZE		4096
> > 
> > These look way too generic names when they are now disconnected from the
> > code using them, not that DELAY_* ever was a good name for anything :-).
> > 
> >> +enum amd_pmc_def {
> >> +       MSG_TEST = 0x01,
> >> +       MSG_OS_HINT_PCO,
> >> +       MSG_OS_HINT_RN,
> >> +};
> > 
> > I suggest you consider adding a prefix for these too.
> 
> But these are there from long time, probably from the inception of
> this driver :-)
> 
> This patch is just cleaning up of the code and move to header for
> readability purpose.
> 
> You mean to say, make the prefix change while I move the macros to header?

Make another patch out of it in the same series please.

-- 
 i.

--8323329-1588588347-1696866553=:1721--
