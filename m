Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BC7326D7A
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602001; cv=none; b=KMrFeVUrO8uhGBqgUtBAwxWh9mymI9A0htWk6z13ndGVbSirIl3uLIrETcwYV238zt87bC/vp1kMVDd9mbjsaY7JWwWx3fgaS1Ffu9hKJ40FooQSl5JrDWrhUWAUHajvF8693hsXHPzvA6oZ2yPoptQzmBG1WzEolkYGW175RpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602001; c=relaxed/simple;
	bh=pEFtiscj5DREnJEfwBtXHVBtqlRm+veAxBzPTwLa8Ng=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nk8SJDpb7JJNfFzpZyVMu7yPxoiGD9LJxGledS29Tymjex6dF3fInEwlhxmgCH+DC7151Vkg4qeoxCNtrPlQCcYyLPCvjin/vJcEM0sZLKx0NjssVZ5FYKoO0gC+901mccRsWiMe3xsBcPzdHzy6kG5q46Kjk1/tUtN8ScWk0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWdQCXAw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWdQCXAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755602000; x=1787138000;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pEFtiscj5DREnJEfwBtXHVBtqlRm+veAxBzPTwLa8Ng=;
  b=PWdQCXAwjKNdWesHRC/tg8nvG4FwxfUIz0glzhPF6eHlGEmSV695tmpt
   hw8xmkDR/RnF3CuKn8tYI9wBVXwHrdyepegBaoeYX3OmLNXl35Dno6ZXd
   aHiZ3bYB96Wm0ip7MUeYwj31KTeCZ3nUwvI+wRncrNhF736T04IGQEJJR
   3pKTDaSuacbaxu4/TcG7l6kJ+0y4SxgcrZfSnFHjEQok9jCpM5lvOEdv3
   /2t67XULqEpsYUrG8NGXrVIEnu5AGlJ93L9fWNCpsmbyVj+M/JTqU4bY2
   WOdV0o5EGDmoigjiQ1X/mseg5MAKDAsoNdy959Znds8QASp36EhcuMyio
   Q==;
X-CSE-ConnectionGUID: S/jx71cSSe+vaJrEs6vneg==
X-CSE-MsgGUID: SkXw+TidTVqf0w8YZe0zpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57046341"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57046341"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:13:19 -0700
X-CSE-ConnectionGUID: BztXZokfTaWxSMo3cqfUHg==
X-CSE-MsgGUID: PI2Urq52R7+esOmOxHhpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172247738"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:13:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 14:13:13 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH v3 3/9] platform/x86/amd/pmf: Extend custom BIOS inputs
 for more policies
In-Reply-To: <20250723064121.2051232-4-Shyam-sundar.S-k@amd.com>
Message-ID: <e8e1fbe0-6f39-ac08-df46-6a7f6f013051@linux.intel.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com> <20250723064121.2051232-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Shyam Sundar S K wrote:

> The existing amd_pmf driver is limited to supporting just two custom BIOS
> inputs. However, with the updates to the latest PMF TA, there's a
> requirement to broaden this capacity to handle 10 inputs, aligning with
> the TA firmware's capabilities.
> 
> The necessary logic should be implemented to facilitate this expansion of
> functionality.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 14 +++++++++++++-
>  drivers/platform/x86/amd/pmf/spc.c | 24 ++++++++++++++++++++++--
>  2 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 79defe2c91e6..f6cd7584aaf8 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -119,6 +119,8 @@ struct cookie_header {
>  
>  #define APTS_MAX_STATES		16
>  
> +#define CUSTOM_BIOS_INPUT_MAX	10

Derive this in a helper doing two ARRAY_SIZE()s instead to force the sizes 
to be in sync with the arrays.

>  /* APTS PMF BIOS Interface */
>  struct amd_pmf_apts_output {
>  	u16 table_version;
> @@ -631,6 +633,14 @@ struct amd_pmf_pb_bitmap {
>  static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
>  	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
>  	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(7)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(8)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(9)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(10)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(11)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(12)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(13)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
>  };
>  
>  enum platform_type {
> @@ -714,7 +724,9 @@ struct ta_pmf_condition_info {
>  	u32 workload_type;
>  	u32 display_type;
>  	u32 display_state;
> -	u32 rsvd5[150];
> +	u32 rsvd5_1[17];
> +	u32 bios_input[8];

bios_input_2 for consistency?

> +	u32 rsvd5[125];
>  };
>  
>  struct ta_pmf_load_policy_table {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 3e3f5a2473bc..5e0218ec8872 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -70,8 +70,24 @@ static const char *ta_slider_as_str(unsigned int state)
>  	}
>  }
>  
> +static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)

As mentioned in patch 2, add this already in it.

> +{
> +	switch (index) {
> +	case 0:
> +		return in->ev_info.bios_input_1[index];
> +	case 1:
> +		return in->ev_info.bios_input_1[index];

Here too, these can use the same code. Maybe use 0 ... 1: notation for 
consistency.

> +	case 2 ... 9:
> +		return in->ev_info.bios_input[index - 2];
> +	default:
> +		return 0;
> +	}
> +}
> +
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
> +	int i;
> +
>  	dev_dbg(dev->dev, "==== TA inputs START ====\n");
>  	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
>  	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
> @@ -90,8 +106,9 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
>  	dev_dbg(dev->dev, "Laptop placement: %s\n",
>  		laptop_placement_as_str(in->ev_info.device_state));
> -	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input_1[0]);
> -	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input_1[1]);
> +	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++)
> +		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
> +			amd_pmf_get_ta_custom_bios_inputs(in, i));
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -112,6 +129,9 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
>  	case 1:
>  		in->ev_info.bios_input_1[index] = value;
>  		break;
> +	case 2 ... 9:
> +		in->ev_info.bios_input[index - 2] = value;
> +		break;
>  	default:
>  		return;
>  	}
> 

-- 
 i.

