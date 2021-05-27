Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF64C4708C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63457613D3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbhE0JT0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 05:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55124 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235864AbhE0JSz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 05:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622107040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wtglam58NILojryBeiybReUivswOYd7l0ys5JArRvSs=;
        b=fpEbEAGUTINdAardRl6BiCVXqVkOB/flbvAJcRVkwzRg2Ll6GQTe7JbYDft7aBIxKXqvPy
        N4EbXEWpDO0RpTWVxURDyimRtbZQtZc/mj7TQbrFs1zgU+1omg0KSCi9g/a3DRSbB7pZ2+
        ap8kbsyhPabZ5VVzf+bypYuj7/GKmLI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-NVf1CAzUNPKLxyQH4ItSmQ-1; Thu, 27 May 2021 05:17:18 -0400
X-MC-Unique: NVf1CAzUNPKLxyQH4ItSmQ-1
Received: by mail-ed1-f72.google.com with SMTP id y17-20020a0564023591b02903886c26ada4so5028edc.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 02:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wtglam58NILojryBeiybReUivswOYd7l0ys5JArRvSs=;
        b=XGTVCiDkb2+UBPM2XCQlpnhtga7g0dfo/4OZKIlxbpFl71UpuQmK9QxsKzDXgjXuPp
         UbQzcH813M5NbrDfVPrRSdRWSCF7aOyGlE8X7M1DKVFleKqiz5vmQc2eb/TfBspVV99+
         pZZr3XavP416EHdzzOO+f0SV/5ZtwGwgy+cZ9x5+ijYS5xHvMzDdYkOq/+KIfVus5ty7
         RY69jqv+ZXDKtKU3Az/qhdlSOtTIaW8TTd9oNDMSd8EjsuoXpIFb1E8Ro+AVP0NhvDWU
         OjKfcez23uc1zNJ8YzZvvydnh3uabxakZFjk/U3EKIY3HR4re3wj9SC9Pw7St8enfR0N
         ZJvQ==
X-Gm-Message-State: AOAM533ZtgxWaQgDwepO5tk0I5klH2ZLxCvpy+/Ertph7i8RoEIZVD0N
        EUWXlboFgR60mNwHC+03jwQ3yEk0XPrEWIMQPkhsJAfx7Xy3itH8Jk7WIoPmWlafTBdIwWRuIsr
        jeH9sl38qAJVSQ80NuyVsafV4V3GOI6StkXNaYPqWL8YqopajCSqURqPWbqKlHcGpCit9okjAxp
        9dcwfhqourjg==
X-Received: by 2002:a17:906:c0c6:: with SMTP id bn6mr2662094ejb.436.1622107037262;
        Thu, 27 May 2021 02:17:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyID1YSQ6kyqed89RMv51/JcKlkgYwDICLjd8u1YnBxfB9UuavKDsJLUN4AGK4bKolxAmoeEQ==
X-Received: by 2002:a17:906:c0c6:: with SMTP id bn6mr2662064ejb.436.1622107037027;
        Thu, 27 May 2021 02:17:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e23sm780772eds.2.2021.05.27.02.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 02:17:16 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI interface support
 on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     andy.shevchenko@gmail.com, prasanth.ksr@dell.com,
        divya.bharathi@dell.com, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d7de87e0-8ce9-9da6-e2f4-71340e09890f@redhat.com>
Date:   Thu, 27 May 2021 11:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526201447.3686-3-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark, Andy,

So as mentioned in my reply to patch 1/3, overall this looks pretty good.
There are a few very small issues remaining, but they are so small that
I've decided to fix them up and merge this into my review-hans branch
with the issues fixed up.

I plan to let this sit in review-hans a bit longer then usual to
give you (Mark) a chance to check out the changes and ack them
and to give Andy the time to check if his review remarks were
addressed to his liking.

I've put remarks inline / below about the 2 things which
I've fixed up in this patch.

Andy, thank you for your review of this. Your suggestions have
improved this driver, esp. the use of kasprintf has made some
of the functions a lot better.

On 5/26/21 10:14 PM, Mark Pearson wrote:

<snip>

> +/* Extract error string from WMI return buffer */
> +static int tlmi_extract_error(const struct acpi_buffer *output)
> +{
> +	const union acpi_object *obj;
> +
> +	obj = output->pointer;
> +	if (!obj)
> +		return -ENOMEM;
> +	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
> +		kfree(obj);

This kfree() should not be here, all the callers of
tlmi_extract_error() unconditionally call:

	kfree(output->pointer);

after calling tlmi_extract_error() so if hit this path with
the kfree(obj) in place we get a double free.

I've dropped the kfree() in my review-hans branch, as well as the
now no longer necessary {}.

> +		return -EIO;
> +	}
> +	return tlmi_errstr_to_err(obj->string.pointer);
> +}
> +
> +/* Utility function to execute WMI call to BIOS */
> +static int tlmi_simple_call(const char *guid, const char *arg)
> +{
> +	const struct acpi_buffer input = { strlen(arg), (char *)arg };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	int i, err;
> +
> +	/*
> +	 * Duplicated call required to match bios workaround for behavior
> +	 * seen when WMI accessed via scripting on other OS.
> +	 */
> +	for (i = 0; i < 2; i++) {
> +		/* (re)initialize output buffer to default state */
> +		output.length = ACPI_ALLOCATE_BUFFER;
> +		output.pointer = NULL;
> +
> +		status = wmi_evaluate_method(guid, 0, 0, &input, &output);
> +		if (ACPI_FAILURE(status)) {
> +			kfree(output.pointer);
> +			return -EIO;
> +		}
> +		err = tlmi_extract_error(&output);
> +		kfree(output.pointer);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +/* Extract output string from WMI return buffer */
> +static int tlmi_extract_output_string(const struct acpi_buffer *output,
> +					char **string)
> +{
> +	const union acpi_object *obj;
> +	char *s;
> +
> +	obj = output->pointer;
> +	if (!obj)
> +		return -ENOMEM;
> +	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
> +		kfree(obj);

Same as above, also fixed in the same way.

> +		return -EIO;
> +	}
> +
> +	s = kstrdup(obj->string.pointer, GFP_KERNEL);
> +	if (!s)
> +		return -ENOMEM;
> +	*string = s;
> +	return 0;
> +}
> +
> +/* ------ Core interface functions ------------*/

Regards,

Hans

