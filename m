Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714CE5FEE6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121795; cv=none; b=YVGPGD3AldPZ5jHbCVoJddoLvsodwsN3iEIY5K5zKeC9PeDkd75JFSxzTHuzW8F7g+CKwCz8AYyopwaONli2vVUguymh9t2RsFrD6gxyjSueIZn/Eztdf6J4ksNM5UnXPMpHhuej0LvFNn6VL/eVtYx6VMrTuPhLG9PupisGTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121795; c=relaxed/simple;
	bh=CzFdLt4JyYTqsVUjD5gJPS9k36mdesCvHYroK/V5ZtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZhDDiATq+7hZm+NfV7CDOSLMlUPdVSFsKC4x9mNcnZkatzjq+DeEv/p/KanE8om41VGL8UAVD6Il15z5DpaUgQ1DoDN4oMwKXQtaN+dQBFbUM9EIgO/3k65Zk/8YO5Zx55XR7suHwJ6bWs8/jQWQm+iS1jnRFReq8iqBqNWwyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UAD5bSSh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UAD5bSSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721121792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEWcjUfhaYfxgYbbLyYUl4A1hHh/hCaPzqQclrhnJvQ=;
	b=UAD5bSShZqOYboJbuWBtiLlEk6E6DNpAlXbOWMB1LB6WvJGiFXxyunhhXt15sYus2Go0cg
	gBUjS6EUPCpuesRnnrYTnPClAUInzugT0LiHogh+hOq78WBFuT9Ush5lp5k7PXH+jHL9tp
	pI2gPw0jKi8E2ferUGoALWvX2iNDIsg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-DwHNFVNgM2i3zbEndJf9SQ-1; Tue, 16 Jul 2024 05:23:10 -0400
X-MC-Unique: DwHNFVNgM2i3zbEndJf9SQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e98c1a9d2so5553814e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 02:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721121788; x=1721726588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEWcjUfhaYfxgYbbLyYUl4A1hHh/hCaPzqQclrhnJvQ=;
        b=N2LHzrZzdTdfT7xkrPjJQcV0nsVOlK35om+Upd6+RD5wf6XHw5PhngQ3cQqAGbjheg
         JQ7Y1vTWIUIrFjTBsXjgpTHmh3S45cDrIdlkUzzF/ervvpa8SOv9Nros/xhQ4QlNo5DB
         qEgngBsFVuhKjxclKyvqj9NHkHUvW3md2fuV2u+AA076PTd8pkTrf5ZFrKaqFZV9kOrt
         9AGIFw1vnrK+P3IJttpufn8xSlhnvjB/grTEqk/9XDMfYtQIBxvAbabY0QvqDd1R05Rm
         r3d/Hzy7h8Ruydy/Cj63yqHwmhGVSnxRevnpWOpjtxJufnbzhOSZwxC/fqFTeIUXdXSS
         weig==
X-Forwarded-Encrypted: i=1; AJvYcCV2/DVXpM+ZzF7BUYiy/zEUKLgbdM5v96tN9P4Ray7EA92puTFUaOvzSc5tEYYYsLp5ZmgAFj5RAoqb8kMwa4mgzxQe6QfjElzeFea5+RbKpYZ1vA==
X-Gm-Message-State: AOJu0YzjnsWKM8p9LxWm/qj3owOER/XFuYedGIMPDbwKwpte/W3wQB95
	HffNIqmIxlUMeNhqTop9b66VHAI7VYKo2cm/n6/svUPy4+xyr/zGXBRLkSYh1JXCwropISH7W5d
	V9nHWsQQdYTZEpsa80Rs4/iHxp/cyn0izrdY/Ykfdea4/Txo+eVifKZBvn7EY6k9o4iKMvGk=
X-Received: by 2002:a05:6512:2355:b0:52c:dca7:c9bd with SMTP id 2adb3069b0e04-52edf02307emr978593e87.30.1721121788344;
        Tue, 16 Jul 2024 02:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJncws79XRTzgOf8xgugqHTD+bGgIyLMXZZ6UgcB51t2NtKZbOgCoVScjh6VuIXGz7ft+mMA==
X-Received: by 2002:a05:6512:2355:b0:52c:dca7:c9bd with SMTP id 2adb3069b0e04-52edf02307emr978574e87.30.1721121787935;
        Tue, 16 Jul 2024 02:23:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5e8609sm288336866b.94.2024.07.16.02.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:23:07 -0700 (PDT)
Message-ID: <f5bf195e-7a46-48f6-960f-f187be0131d5@redhat.com>
Date: Tue, 16 Jul 2024 11:23:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] platform/x86: asus-wmi: fix TUF laptop RGB variant
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <20240716011130.17464-1-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240716011130.17464-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/16/24 3:11 AM, Luke D. Jones wrote:
> Changelog
> - v1:
>   - Fix subject and fixes tag

Small remark for the next time you post a new version of a patch.

Since you already posted the version with the Fixes tag as subject
before, this is v2; and ...

> History:
>  - v0: https://lore.kernel.org/platform-driver-x86/5c4ef8d8-2806-5bb6-2946-368cf1ebbac6@linux.intel.com/T/#m9ceb12d4d135e28e71e4d74ecc9a78083a6c8745

This would be v1.

Regards,

Hans


