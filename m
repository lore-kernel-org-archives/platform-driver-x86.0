Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B40C43219
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 14:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239649AbiKQOAB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 09:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbiKQOAA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 09:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DC051316
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668693538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qiJ6CzrxH2WCE62u+R1t9vC1j8zkfSIF2Zo4SZ38F/U=;
        b=AJiLP4PSbbA142KjlMnKxWpKsp1ynGCYlSwH0wQ5quZ2zJjJzSVzbFHFqd33nj1OjzLgno
        y795Fg0OZN6NyiZD2mrZByZZs3KFVssnuLMEbWfIwDpAjDDc2rUZVARLdeMZrSES8hq35L
        QwWDFGWJu916SZ4JjFmZUFJnHWkeqfY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-8AgPuVH_P8-COEnbgJR30g-1; Thu, 17 Nov 2022 08:58:57 -0500
X-MC-Unique: 8AgPuVH_P8-COEnbgJR30g-1
Received: by mail-ed1-f72.google.com with SMTP id z15-20020a05640240cf00b00461b253c220so1275768edb.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qiJ6CzrxH2WCE62u+R1t9vC1j8zkfSIF2Zo4SZ38F/U=;
        b=5Pwty1CXEARBgP6aYeZFlsCDkGt18CeG7fKYhcWCk8LkourROhOznfhp3ioftpN25R
         9YyV8snkhVHAYvdE8isp1LSLPPOQHqdGZBQG1Kdp5DX6ptz5z4QWDH8I2ef+Hfpre8da
         IJrKrYcTUWeZ6ltwBmw7gSJp3OgQ7H+Vskt6FTdFn3x37io4UtsZnJhID0mWzhzDT+G/
         oXwu3hg7iHrXJjlHCRLaLYZmSKYn/LGL5kFHmYwEl5THCPAwNmrWVd6Gm89LAOrXRL3T
         yhfpr9SxHwuiNJqt3VhRFCf+Myu2XL4f5+30bPwlkrM2PFB9Km3Lks1jBI0SstPNNLs0
         63Lw==
X-Gm-Message-State: ANoB5pneHmOujb8vyxkNhgTEQxgfzVYlWalCgoVuTQ3GVI1crp09TQSe
        L5h/0NN2BONxe4zjpF3XHJCAyuaxCzR/jtDcvxcvGuP9KHweqHgHNPG89KE2V60uAooC/NBntPj
        a6RlI2LfCxPvre5yVmkG/fkgRyPLdNjR90Q==
X-Received: by 2002:a05:6402:4011:b0:461:96ba:b9c with SMTP id d17-20020a056402401100b0046196ba0b9cmr2242878eda.353.1668693536132;
        Thu, 17 Nov 2022 05:58:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4p9LbCCuQjivxrS8d8F09KLSLDPML23d+fURreyDYJwIgdIv6D4e5yWRupbPMx9K0LDeE5Dw==
X-Received: by 2002:a05:6402:4011:b0:461:96ba:b9c with SMTP id d17-20020a056402401100b0046196ba0b9cmr2242866eda.353.1668693535959;
        Thu, 17 Nov 2022 05:58:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a13-20020a17090682cd00b0078d424e8c09sm405308ejy.77.2022.11.17.05.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:58:55 -0800 (PST)
Message-ID: <afa1b8cd-65fa-c31d-38e6-d8456df4c4f5@redhat.com>
Date:   Thu, 17 Nov 2022 14:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 9/9] tools/arch/x86: intel_sdsi: Add support for reading
 meter certificates
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, srinivas.pandruvada@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
 <20221101191023.4150315-10-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101191023.4150315-10-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/1/22 20:10, David E. Box wrote:
> Add option to read and decode On Demand meter certificates.
> 
> Link: https://github.com/intel/intel-sdsi/blob/master/meter-certificate.rst
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  tools/arch/x86/intel_sdsi/intel_sdsi.c | 110 ++++++++++++++++++++++++-
>  1 file changed, 107 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/arch/x86/intel_sdsi/intel_sdsi.c b/tools/arch/x86/intel_sdsi/intel_sdsi.c
> index 0680eda78b1a..ebf076ee6ef8 100644
> --- a/tools/arch/x86/intel_sdsi/intel_sdsi.c
> +++ b/tools/arch/x86/intel_sdsi/intel_sdsi.c
> @@ -39,8 +39,10 @@
>  #define GUID_V2			0xF210D9EF
>  #define REGISTERS_MIN_SIZE	72
>  #define STATE_CERT_MAX_SIZE	4096
> +#define METER_CERT_MAX_SIZE	4096
>  #define STATE_MAX_NUM_LICENSES	16
>  #define STATE_MAX_NUM_IN_BUNDLE	(uint32_t)8
> +#define METER_MAX_NUM_BUNDLES	8
>  
>  #define __round_mask(x, y) ((__typeof__(x))((y) - 1))
>  #define round_up(x, y) ((((x) - 1) | __round_mask(x, y)) + 1)
> @@ -150,6 +152,21 @@ struct bundle_encoding {
>  	uint32_t encoding_rsvd[7];
>  };
>  
> +struct meter_certificate {
> +	uint32_t block_signature;
> +	uint32_t counter_unit;
> +	uint64_t ppin;
> +	uint32_t bundle_length;
> +	uint32_t reserved;
> +	uint32_t mmrc_encoding;
> +	uint32_t mmrc_counter;
> +};
> +
> +struct bundle_encoding_counter {
> +	uint32_t encoding;
> +	uint32_t counter;
> +};
> +
>  struct sdsi_dev {
>  	struct sdsi_regs regs;
>  	struct state_certificate sc;
> @@ -160,6 +177,7 @@ struct sdsi_dev {
>  
>  enum command {
>  	CMD_SOCKET_INFO,
> +	CMD_METER_CERT,
>  	CMD_STATE_CERT,
>  	CMD_PROV_AKC,
>  	CMD_PROV_CAP,
> @@ -306,6 +324,86 @@ static void get_feature(uint32_t encoding, char *feature)
>  	feature[0] = name[3];
>  }
>  
> +static int sdsi_meter_cert_show(struct sdsi_dev *s)
> +{
> +	char buf[METER_CERT_MAX_SIZE] = {0};
> +	struct bundle_encoding_counter *bec;
> +	struct meter_certificate *mc;
> +	uint32_t count = 0;
> +	FILE *cert_ptr;
> +	int ret, size;
> +
> +	ret = sdsi_update_registers(s);
> +	if (ret)
> +		return ret;
> +
> +	if (!s->regs.en_features.sdsi) {
> +		fprintf(stderr, "SDSi feature is present but not enabled.\n");
> +		fprintf(stderr, " Unable to read meter certificate\n");
> +		return -1;
> +	}
> +
> +	if (!s->regs.en_features.metering) {
> +		fprintf(stderr, "Metering not supporting on this socket.\n");
> +		return -1;
> +	}
> +
> +	ret = chdir(s->dev_path);
> +	if (ret == -1) {
> +		perror("chdir");
> +		return ret;
> +	}
> +
> +	cert_ptr = fopen("meter_certificate", "r");
> +	if (!cert_ptr) {
> +		perror("Could not open 'meter_certificate' file");
> +		return -1;
> +	}
> +
> +	size = fread(buf, 1, sizeof(buf), cert_ptr);
> +	if (!size) {
> +		fprintf(stderr, "Could not read 'meter_certificate' file\n");
> +		fclose(cert_ptr);
> +		return -1;
> +	}
> +	fclose(cert_ptr);
> +
> +	mc = (struct meter_certificate *)buf;
> +
> +	printf("\n");
> +	printf("Meter certificate for device %s\n", s->dev_name);
> +	printf("\n");
> +	printf("Block Signature:       0x%x\n", mc->block_signature);
> +	printf("Count Unit:            %dms\n", mc->counter_unit);
> +	printf("PPIN:                  0x%lx\n", mc->ppin);
> +	printf("Feature Bundle Length: %d\n", mc->bundle_length);
> +	printf("MMRC encoding:         %d\n", mc->mmrc_encoding);
> +	printf("MMRC counter:          %d\n", mc->mmrc_counter);
> +	if (mc->bundle_length % 8) {
> +		fprintf(stderr, "Invalid bundle length\n");
> +		return -1;
> +	}
> +
> +	if (mc->bundle_length > METER_MAX_NUM_BUNDLES * 8)  {
> +		fprintf(stderr, "More the %d bundles: %d\n",
> +			METER_MAX_NUM_BUNDLES, mc->bundle_length / 8);
> +		return -1;
> +	}
> +
> +	bec = (void *)(mc) + sizeof(mc);
> +
> +	printf("Number of Feature Counters:          %d\n", mc->bundle_length / 8);
> +	while (count++ < mc->bundle_length / 8) {
> +		char feature[5];
> +
> +		feature[4] = '\0';
> +		get_feature(bec[count].encoding, feature);
> +		printf("    %s:          %d\n", feature, bec[count].counter);
> +	}
> +
> +	return 0;
> +}
> +
>  static int sdsi_state_cert_show(struct sdsi_dev *s)
>  {
>  	char buf[STATE_CERT_MAX_SIZE] = {0};
> @@ -625,7 +723,7 @@ static void sdsi_free_dev(struct sdsi_dev *s)
>  
>  static void usage(char *prog)
>  {
> -	printf("Usage: %s [-l] [-d DEVNO [-i] [-s] [-a FILE] [-c FILE]]\n", prog);
> +	printf("Usage: %s [-l] [-d DEVNO [-i] [-s] [-m] [-a FILE] [-c FILE]]\n", prog);
>  }
>  
>  static void show_help(void)
> @@ -635,6 +733,7 @@ static void show_help(void)
>  	printf("  %-18s\t%s\n", "-d, --devno DEVNO",    "On Demand device number");
>  	printf("  %-18s\t%s\n", "-i, --info",           "show socket information");
>  	printf("  %-18s\t%s\n", "-s, --state",          "show state certificate");
> +	printf("  %-18s\t%s\n", "-m, --meter",          "show meter certificate");
>  	printf("  %-18s\t%s\n", "-a, --akc FILE",       "provision socket with AKC FILE");
>  	printf("  %-18s\t%s\n", "-c, --cap FILE>",      "provision socket with CAP FILE");
>  }
> @@ -656,6 +755,7 @@ int main(int argc, char *argv[])
>  		{"help",	no_argument,		0, 'h'},
>  		{"info",	no_argument,		0, 'i'},
>  		{"list",	no_argument,		0, 'l'},
> +		{"meter",	no_argument,		0, 'm'},
>  		{"state",	no_argument,		0, 's'},
>  		{0,		0,			0, 0 }
>  	};
> @@ -663,7 +763,7 @@ int main(int argc, char *argv[])
>  
>  	progname = argv[0];
>  
> -	while ((opt = getopt_long_only(argc, argv, "+a:c:d:hils", long_options,
> +	while ((opt = getopt_long_only(argc, argv, "+a:c:d:hilms", long_options,
>  			&option_index)) != -1) {
>  		switch (opt) {
>  		case 'd':
> @@ -676,8 +776,9 @@ int main(int argc, char *argv[])
>  		case 'i':
>  			command = CMD_SOCKET_INFO;
>  			break;
> +		case 'm':
>  		case 's':
> -			command = CMD_STATE_CERT;
> +			command = (opt == 'm') ? CMD_METER_CERT : CMD_STATE_CERT;
>  			break;

please just make this 2 separate cases rather then testing opt after
just having done a switch-case on opt.

Other then that this looks good to me, so with that fixed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


>  		case 'a':
>  		case 'c':
> @@ -713,6 +814,9 @@ int main(int argc, char *argv[])
>  		case CMD_SOCKET_INFO:
>  			ret = sdsi_read_reg(s);
>  			break;
> +		case CMD_METER_CERT:
> +			ret = sdsi_meter_cert_show(s);
> +			break;
>  		case CMD_STATE_CERT:
>  			ret = sdsi_state_cert_show(s);
>  			break;

