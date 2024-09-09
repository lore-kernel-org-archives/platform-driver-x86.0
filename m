Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D012B1B5EB7
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892746; cv=none; b=pgbcQxZ233KYHBnqq9UYdQ9bUKrSkYwQgPymloCVfZ2P+8rul9r96FHlyXOC2Jei9b9GCJC8X8irtYZ/fu8daCIIZ1Fh3O2avVwNq04GRrQ06v+D1B0fx94zWf1i4B/SfZRLlLAkFFmQj6i78t7g7a/LgUpxmCAQ5sAb0z1o1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892746; c=relaxed/simple;
	bh=oFs8eFtMRafE5ULesdhHuUhZPNcV5g4ad1jjXWG62nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG+PPoUNzBSNAunrKJu/lQSfX0YJoNQ+mi9YQuMF8O7e0qUEkHQbVxg6JLNPqxXM/YsHqcijw8ynRV45QjygEyPc9QoL8o6rn4uHy+WZSTEo6I+YJ0D1B8VtsvUo2XmzIw+9CToilIdpRHi0zVskQVXgoCusYfFlA/hiwlu1/xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LFL2VyY8; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LFL2VyY8"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-458320b30e7so4526961cf.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Sep 2024 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725892744; x=1726497544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ixNkNREDkxIhRpTVrMqW4ltdM0RlgCXJC77xBu0jWQ=;
        b=LFL2VyY8IZzhmjHTLcZizkD8Eu+AVcG0uW3/b1iVMiafmIUxcgIqOpgzOen0+pAA9e
         p+mRzgVGblPUapoU+/pXO0Xf+koeEMErvCk2OynGIQLSu6GJwdmMVcR3WnGIgw8THnAr
         6ja0oPBtPJjFf3PmjGF4onU8m6F3HT/sYUMVJsABqGBvj/g4F1q5tr+fgf7KloQzl4ty
         V3idCVRdeSX15GXD3bYWKopA6scM9WHPeWs9TvfhfXjJr15dahnD78tccvcDq/Zg7E+D
         uFtg6OFNp2Cd6fd1WTk63vdGgrf6+K+vC/YvuyHnizdxua4Yxy2Euv4rL6LEKhzdz2fL
         VBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892744; x=1726497544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ixNkNREDkxIhRpTVrMqW4ltdM0RlgCXJC77xBu0jWQ=;
        b=Lr96gOK3GemSsXLAsoAu4Bgjua47jPKP4OYt1tEc3bQJ1/RQdwhdE6ElMcGjpIGzz2
         8hPChDWblVEKpOzeTVew4q6vwkaabQcVNxv/q9SLcDQyReA1m3F4UqFDAH4yOUPcqbbQ
         RJLYBPymdUDTaQHifk+kPiTSMfscJgzIifp6jkWCESnmNEejzY1QOKuDoY5N/i37d8WM
         HQhAJotbbhbDu9BOs6Dv+64O812iKgKSAFrE1qR8na45qjqT3/jnaXgzngPcQULFwuEV
         K2zm7h7JGAK6oIkcIhog1feraATswM7UXGXVJqEHXV0DZVQTFaomr2b9CDll4jIhJrZG
         EsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzNkVXupRLLJPBqfg6IegzHAANGMzdgC/ZcYQSPKra22KZ8sUnBukfFMIq9SAVChRqHZpvUnNFZ5kWduEovh9/BLl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxRS2IvcY0/gPZK251fyKvalGcKz6hTsOnZAdPAHwjpgN5KlpFQ
	iyrB9sw8ZIEG4PS52KJToNGMRZ6QGHG/rin254HTgMciDgNvOFoetVoNcpcXCA==
X-Google-Smtp-Source: AGHT+IHf+lwMdH6sVGdXhrfRvW4mi7kkSmEvFRcCY3mHy6ZUooM9nvWS+oe2RLkh9Tcrwbr0JGX/JA==
X-Received: by 2002:ac8:7dc5:0:b0:446:5c35:d9c8 with SMTP id d75a77b69052e-4581f57bcdcmr64604001cf.30.1725892743725;
        Mon, 09 Sep 2024 07:39:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822f95656sm20741211cf.91.2024.09.09.07.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:39:02 -0700 (PDT)
Date: Mon, 9 Sep 2024 10:38:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org,
	jorge.lopez2@hp.com, acelan.kao@canonical.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne
 440
Message-ID: <7be0c87a-c00f-4346-8482-f41ef0249b57@rowland.harvard.edu>
References: <20240906053047.459036-1-kai.heng.feng@canonical.com>
 <d8600868-6e4b-45ab-b328-852b6ac8ecb5@rowland.harvard.edu>
 <CAAd53p4i1zzW2DsVfirjXVsQX0AgXy1XbzWaM-ziWmAmp8J1=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p4i1zzW2DsVfirjXVsQX0AgXy1XbzWaM-ziWmAmp8J1=A@mail.gmail.com>

On Mon, Sep 09, 2024 at 11:05:05AM +0800, Kai-Heng Feng wrote:
> On Fri, Sep 6, 2024 at 10:22 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, Sep 06, 2024 at 01:30:47PM +0800, Kai-Heng Feng wrote:
> > > The HP ProOne 440 has a power saving design that when the display is
> > > off, it also cuts the USB touchscreen device's power off.
> > >
> > > This can cause system early wakeup because cutting the power off the
> > > touchscreen device creates a disconnect event and prevent the system
> > > from suspending:
> >
> > Is the touchscreen device connected directly to the root hub?  If it is
> > then it looks like there's a separate bug here, which needs to be fixed.
> >
> > > [  445.814574] hub 2-0:1.0: hub_suspend
> > > [  445.814652] usb usb2: bus suspend, wakeup 0
> >
> > Since the wakeup flag is set to 0, the root hub should not generate a
> > wakeup request when a port-status-change event happens.
> 
> The disconnect event itself should not generate a wake request, but
> the interrupt itself still needs to be handled.
> 
> >
> > > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, portsc: 0x202a0
> > > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
> >
> > But it did.  This appears to be a bug in one of the xhci-hcd suspend
> > routines.

I failed to notice before that the suspend message message above is for 
bus 2 whereas the port change event here is on bus 1.  Nevertheless, I 
assume that bus 1 was suspended with wakeup = 0, so the idea is the 
same.

> So should the xhci-hcd delay all interrupt handling after system resume?

It depends on how the hardware works; I don't know the details.  The 
best approach would be: when suspending the root hub with wakeup = 0, 
the driver will tell the hardware not to generate interrupt requests for 
port-change events (and then re-enable those interrupt requests when the 
root hub is resumed, later on).

If that's not possible, another possibility is that the driver could 
handle the interrupt and clear the hardware's port-change status bit but 
then not ask for the root hub to be resumed.  However, this would 
probably be more difficult to get right.

Alan Stern
