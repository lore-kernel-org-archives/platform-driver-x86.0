Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A6AC47089
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 12:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77226613AA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 12:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbhE0MVk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 08:21:40 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:48908 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234091AbhE0MVj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 08:21:39 -0400
Received: from [100.112.2.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-east-1.aws.symcld.net id B7/24-59816-67E8FA06; Thu, 27 May 2021 12:20:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleJIrShJLcpLzFFi42LJePGQV7esb32
  CQecSRouXEw4zWhzacIDJort7LpPFm+PTmSxW73nBbLHo4xM2BzaPSTNnMHvsnHWX3eP9vqts
  Hp83yQWwRLFm5iXlVySwZtw9eJq9YJFUxfJZRxkbGP+KdDFycggJ/GeU6Hgd3cXIBWQ/ZpS4t
  WYaM0hCWKBIYs20jewgtoiAusTUjh42kCJmgdmMEuc+H2eG6NjOKPGzbTJYB5uAtsSWLb/YQG
  xeAVuJGWdWgMVZBFQl3j6/ygpiiwqES+zueMkEUSMocXLmExYQm1PATuLn9QYgmwNog6bE+l3
  6IGFmAXGJW0/mM0HY8hLb385hBimREFCUODjFAiQsIZAg0fPvEdsERsFZSIbOQhg0C8mgWUgG
  LWBkWcVollSUmZ5RkpuYmaNraGCga2hopGusa2RgrJdYpZukV1qsm5pYXKJrqJdYXqxXXJmbn
  JOil5dasokRGDcpBcyndzAuffNB7xCjJAeTkijvBJ31CUJ8SfkplRmJxRnxRaU5qcWHGGU4OJ
  QkeMV7gXKCRanpqRVpmTnAGIZJS3DwKInwrusGSvMWFyTmFmemQ6ROMSpKifNm9wAlBEASGaV
  5cG2wtHGJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvLcgUnsy8Erjpr4AWMwEtFkpcB7K4
  JBEhJdXAxPBocxBP6jZX6c9LWfM2/5dqsA7gWtOfIi7Aqh739PvpJVEhO/LfLJ8qLqe09ZTVX
  unT7TvarviGrVmhe+6bdZ30tUcWnAfcQ1sChVfpNOSk8F653xqq96fNku9mqv/2Mh7NHeeS9z
  1gZVyo0HzC8PFTy9drui5nvZe1Do5Ovv527dK0qGnWlw695+MV0Bd/8vD9hvovT3ddCdvS+mj
  HTm9r40qf0giJW1EqVzlici7tOODEOT9aPSTAT+PR63W7503UYGm8qZzUt2JidoC8YsuWxZ0K
  Z5q3Owjqcj5cNftVenHRDrPmNy3G+cw2frqLIrYesZ2a9D7Pu3NLYYG0X94WKYl8ef6pe6dPO
  DZZiaU4I9FQi7moOBEANBRlEpYDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-386.messagelabs.com!1622118005!29973!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22208 invoked from network); 27 May 2021 12:20:06 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-9.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 12:20:06 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id C3BDD866AB2666699409;
        Thu, 27 May 2021 08:20:05 -0400 (EDT)
Received: from [10.46.208.141] (10.46.208.141) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Thu, 27 May
 2021 08:20:05 -0400
Subject: Re: [External] Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <andy.shevchenko@gmail.com>, <prasanth.ksr@dell.com>,
        <divya.bharathi@dell.com>, <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com>
 <d7de87e0-8ce9-9da6-e2f4-71340e09890f@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <f228f3e1-3571-0e2a-3b2d-08f65600c937@lenovo.com>
Date:   Thu, 27 May 2021 08:20:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d7de87e0-8ce9-9da6-e2f4-71340e09890f@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.208.141]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2021-05-27 5:17 a.m., Hans de Goede wrote:
> Hi Mark, Andy,
> 
> So as mentioned in my reply to patch 1/3, overall this looks pretty good.
> There are a few very small issues remaining, but they are so small that
> I've decided to fix them up and merge this into my review-hans branch
> with the issues fixed up.
> 
> I plan to let this sit in review-hans a bit longer then usual to
> give you (Mark) a chance to check out the changes and ack them
> and to give Andy the time to check if his review remarks were
> addressed to his liking.

Sounds good to me.
> 
> I've put remarks inline / below about the 2 things which
> I've fixed up in this patch.
> 
> Andy, thank you for your review of this. Your suggestions have
> improved this driver, esp. the use of kasprintf has made some
> of the functions a lot better.
Seconded :)
Thank you to both of you for the reviews - I learnt a lot with this
particular patch set.
> 
> On 5/26/21 10:14 PM, Mark Pearson wrote:
> 
> <snip>
> 
>> +/* Extract error string from WMI return buffer */
>> +static int tlmi_extract_error(const struct acpi_buffer *output)
>> +{
>> +	const union acpi_object *obj;
>> +
>> +	obj = output->pointer;
>> +	if (!obj)
>> +		return -ENOMEM;
>> +	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
>> +		kfree(obj);
> 
> This kfree() should not be here, all the callers of
> tlmi_extract_error() unconditionally call:
> 
> 	kfree(output->pointer);
> 
> after calling tlmi_extract_error() so if hit this path with
> the kfree(obj) in place we get a double free.
> 
> I've dropped the kfree() in my review-hans branch, as well as the
> now no longer necessary {}.
Agreed - I should have noticed that one. Thanks
> 
>> +		return -EIO;
>> +	}
>> +	return tlmi_errstr_to_err(obj->string.pointer);
>> +}
>> +
>> +/* Utility function to execute WMI call to BIOS */
>> +static int tlmi_simple_call(const char *guid, const char *arg)
>> +{
>> +	const struct acpi_buffer input = { strlen(arg), (char *)arg };
>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	acpi_status status;
>> +	int i, err;
>> +
>> +	/*
>> +	 * Duplicated call required to match bios workaround for behavior
>> +	 * seen when WMI accessed via scripting on other OS.
>> +	 */
>> +	for (i = 0; i < 2; i++) {
>> +		/* (re)initialize output buffer to default state */
>> +		output.length = ACPI_ALLOCATE_BUFFER;
>> +		output.pointer = NULL;
>> +
>> +		status = wmi_evaluate_method(guid, 0, 0, &input, &output);
>> +		if (ACPI_FAILURE(status)) {
>> +			kfree(output.pointer);
>> +			return -EIO;
>> +		}
>> +		err = tlmi_extract_error(&output);
>> +		kfree(output.pointer);
>> +		if (err)
>> +			return err;
>> +	}
>> +	return 0;
>> +}
>> +
>> +/* Extract output string from WMI return buffer */
>> +static int tlmi_extract_output_string(const struct acpi_buffer *output,
>> +					char **string)
>> +{
>> +	const union acpi_object *obj;
>> +	char *s;
>> +
>> +	obj = output->pointer;
>> +	if (!obj)
>> +		return -ENOMEM;
>> +	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
>> +		kfree(obj);
> 
> Same as above, also fixed in the same way.
Thanks
> 
>> +		return -EIO;
>> +	}
>> +
>> +	s = kstrdup(obj->string.pointer, GFP_KERNEL);
>> +	if (!s)
>> +		return -ENOMEM;
>> +	*string = s;
>> +	return 0;
>> +}
>> +
>> +/* ------ Core interface functions ------------*/
> 


Mark
