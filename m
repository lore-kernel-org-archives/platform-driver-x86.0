Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46633192D90
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725974032; cv=none; b=rnKyFHMQ7d3dW7QNsVU/0fz5PGP7v4q1DeEUwaho38HHfdUyZBl8MhfH6ADn2zSSbPZuf5mnLjsfeLcgz89dr/E6SdToXrCHlxn9mORASGFQGBLqJRM2bVl51eCieZgh+qppxi0PSIDJPLQDNOJZdwUgKfVXLTfPyJnc85DQjHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725974032; c=relaxed/simple;
	bh=Td8G0ZhZzKBRWrXjIEUMlAY6Xd0molozO56n4pFV8iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UejBMsQJUxs4XpXBfeu94bsNDqZWccc8yfg0+1H6/KCygUO73IgddM3++pc21RVv1F/wUGSPxkiG4Ld3EHJTWKauYeMhhj7BdIKDVjBUfg1iVdZHuV8rVS3FB3uOBw9y+AHLejdrscRbdDACwrfkJYoADqkBFMfQe8HeOfrYUwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Am+tsIX/; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Am+tsIX/"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a7f8b0b7d0so269468585a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725974029; x=1726578829; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpN52Tl3Y7hU7ZRXluVo1s+cWZSZSn4C8T8BEZMK7SE=;
        b=Am+tsIX/q8YPkmqKLk3MEsUHCWyN0fZsQrPapl2OijcrId7JwKGjfLWRzE3eAh75Tr
         RXyaQ8EkrYjCcg49T97gnEhS9EYBGGsK6bBD+XdLPOhUACQUAo4Ni5muvF8PCCnNUFkC
         I/pzqs8opqqDdBS1g2cKU/VFwi4hccoTQBdysKq0YNZk3HiNRCy/UHt4wgfb8f7Kd6Gi
         7nW0eXu9h74kZoSySijqEWMstVy4XbGDZ7c52a7WKQamWxeFU19w4gyfGTX9v5plm14M
         PUOdZ/bsTo4eYkk1MUY3nh1tyPt3WkWOFsLmwLmZ80Zd+akzbtfGavJ82uTJlB3ePRPn
         c30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725974029; x=1726578829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpN52Tl3Y7hU7ZRXluVo1s+cWZSZSn4C8T8BEZMK7SE=;
        b=NUjyXR1ahj7R16dvNxb/jqYNvUKKa0mtRvo78WGuQUla2heJ1cUEgfjLxEZxFJBlhB
         S1Y+SUGYoa/PcfO0zvk1UXt8nzmQHP/wvJXLzZdNIy3C6unq5xxOSTwbQWiSR1HdeOD7
         jik5nS9Y+uGXzTp0IQ2ddyus4rK+L3ASbAZ/XsCT6+nOyGywJgRSlf0/oomhgLztPq06
         jfmo2Fri0I++Z5cHF3WLe36tY93bh0glv2Tji68UE6fp3awsnhtknpheZCUDItJd3eb/
         6EDmu4wqvYpAU1C/m3BgfJERfmGZZws20BfoeoVo5bFYbp1+Mmj1LZwl72xhSks0hoao
         jMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNjKFCa8sDbQtfQjtJJ0oWXuWYRTCKz2rqpqMlI/r3Bz14YjV5gSh5JS5ZqjDTYok7q3Ab48xmgjtM1xRZmNUR31Wq@vger.kernel.org
X-Gm-Message-State: AOJu0YxbfG6p5vHioKXRs0ifJsyZbG0bjeEnxEuPkXQhXTeWPYTGlZzy
	S1rOcZok3Wh255+AE/QRQK4OxSmvOOzsiRN0DzBXVAuNIdlvgS4v2OGH6q4CBw==
X-Google-Smtp-Source: AGHT+IF5PRcpk2RCeI33il7JeEsHL67QzDDZTB7lIxRX8RSfCSIdG7+kckjVTEpmGMcjUlhDs60Fuw==
X-Received: by 2002:a05:620a:4406:b0:7a9:b8dd:eb96 with SMTP id af79cd13be357-7a9b8ddef9amr999401985a.30.1725974029054;
        Tue, 10 Sep 2024 06:13:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::ed50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a04667sm304784885a.75.2024.09.10.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:13:48 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:13:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org,
	jorge.lopez2@hp.com, acelan.kao@canonical.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne
 440
Message-ID: <fe0d3259-c60b-4ef8-aa42-edb5ca2e2d90@rowland.harvard.edu>
References: <20240906053047.459036-1-kai.heng.feng@canonical.com>
 <d8600868-6e4b-45ab-b328-852b6ac8ecb5@rowland.harvard.edu>
 <CAAd53p4i1zzW2DsVfirjXVsQX0AgXy1XbzWaM-ziWmAmp8J1=A@mail.gmail.com>
 <7be0c87a-c00f-4346-8482-f41ef0249b57@rowland.harvard.edu>
 <CAAd53p7c4-jpZ6OsW+H9qw2mvvr8kSfX2UEf8YrsWJt5koYbAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p7c4-jpZ6OsW+H9qw2mvvr8kSfX2UEf8YrsWJt5koYbAA@mail.gmail.com>

On Tue, Sep 10, 2024 at 11:33:02AM +0800, Kai-Heng Feng wrote:
> On Mon, Sep 9, 2024 at 10:39 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Sep 09, 2024 at 11:05:05AM +0800, Kai-Heng Feng wrote:
> > > On Fri, Sep 6, 2024 at 10:22 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Fri, Sep 06, 2024 at 01:30:47PM +0800, Kai-Heng Feng wrote:
> > > > > The HP ProOne 440 has a power saving design that when the display is
> > > > > off, it also cuts the USB touchscreen device's power off.
> > > > >
> > > > > This can cause system early wakeup because cutting the power off the
> > > > > touchscreen device creates a disconnect event and prevent the system
> > > > > from suspending:
> > > >
> > > > Is the touchscreen device connected directly to the root hub?  If it is
> > > > then it looks like there's a separate bug here, which needs to be fixed.
> > > >
> > > > > [  445.814574] hub 2-0:1.0: hub_suspend
> > > > > [  445.814652] usb usb2: bus suspend, wakeup 0
> > > >
> > > > Since the wakeup flag is set to 0, the root hub should not generate a
> > > > wakeup request when a port-status-change event happens.
> > >
> > > The disconnect event itself should not generate a wake request, but
> > > the interrupt itself still needs to be handled.
> > >
> > > >
> > > > > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, portsc: 0x202a0
> > > > > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
> > > >
> > > > But it did.  This appears to be a bug in one of the xhci-hcd suspend
> > > > routines.
> >
> > I failed to notice before that the suspend message message above is for
> > bus 2 whereas the port change event here is on bus 1.  Nevertheless, I
> > assume that bus 1 was suspended with wakeup = 0, so the idea is the
> > same.
> 
> Yes the bus 1 was already suspended.
> 
> >
> > > So should the xhci-hcd delay all interrupt handling after system resume?
> >
> > It depends on how the hardware works; I don't know the details.  The
> > best approach would be: when suspending the root hub with wakeup = 0,
> > the driver will tell the hardware not to generate interrupt requests for
> > port-change events (and then re-enable those interrupt requests when the
> > root hub is resumed, later on).
> 
> So the XHCI_CMD_EIE needs to be cleared in prepare callback to ensure
> there's no interrupt in suspend callback.

Not in the prepare callback.  Clear it during the suspend callback.

But now reading this and the earlier section, I realize what the problem 
is.  There's only one bit in the command register to control IRQ 
generation, so you can't turn off interrupt requests for bus 1 (the 
legacy USB-2 bus) without also turning them off for bus 2 (the USB-3 
bus).

> Maybe this can be done, but this seems to greatly alter the xHCI suspend flow.
Yes, this approach isn't feasible.

> > If that's not possible, another possibility is that the driver could
> > handle the interrupt and clear the hardware's port-change status bit but
> > then not ask for the root hub to be resumed.  However, this would
> > probably be more difficult to get right.
> 
> IIUC the portsc status bit gets cleared after roothub is resumed. So
> this also brings not insignificant change.
> Not sure if its the best approach.

It should be possible for this to work.  Just make the interrupt 
handler skip calling usb_hcd_resume_root_hub() if wakeup is not enabled 
for the root hub getting the port-status change.  When the root hub 
resumes as part of the system resume later on, the hub driver will check 
and see that a connect change occurred.

Alan Stern
