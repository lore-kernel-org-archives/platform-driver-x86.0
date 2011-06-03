From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control file
Date: Fri, 3 Jun 2011 13:23:55 -0700
Message-ID: <201106031323.55763.dmitry.torokhov@gmail.com>
References: <4DE8FC4A.9010401@absence.it> <4DE92514.8080405@absence.it>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:45777 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965Ab1FCUYB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 16:24:01 -0400
Received: by pxi2 with SMTP id 2so1438713pxi.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jun 2011 13:24:01 -0700 (PDT)
In-Reply-To: <4DE92514.8080405@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

On Friday, June 03, 2011 11:16:52 AM Marco Chiappero wrote:
> Handle 0x0105 allows to change (and store persistently) the touchpad
> state, while notebooks with handle 0x0148 also provides the Fn-F1 combo
> to change the touchpad state, but the key driven change is not handled
> by this patch.

Why do we want to do this? X allows to ignore certain pointing devices 
IIRC.

Thanks.

-- 
Dmitry
