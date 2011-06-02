From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 3/3] ideapad: Show negative when no camera
Date: Thu, 02 Jun 2011 18:17:28 +0800
Message-ID: <4DE76338.30706@canonical.com>
References: <1307006553-12667-1-git-send-email-ike.pan@canonical.com>	<1307006687-12736-1-git-send-email-ike.pan@canonical.com> <BANLkTimfu3pWedHJXtuV-q5risHTyQzNKOaR8P471jmsPfzODg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:39195 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933096Ab1FBKRe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2011 06:17:34 -0400
In-Reply-To: <BANLkTimfu3pWedHJXtuV-q5risHTyQzNKOaR8P471jmsPfzODg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On 06/02/2011 05:43 PM, Corentin Chary wrote:
> I think it would be better to not add the file when the camera is not
> available. Another option is to return -ENODEV. But printing -1
> doesn't seems right.
> 

Agree, making the node invisible is better.
