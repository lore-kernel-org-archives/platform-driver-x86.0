From: =?ISO-8859-1?Q?Marco_Kr=FCger?= <krgsch@gmail.com>
Subject: Re: sony-laptop crash (Sony VPC SE 1V9E) for 3.8.0+
Date: Sat, 21 Sep 2013 23:39:18 +0200
Message-ID: <523E1206.8080001@gmail.com>
References: <51FE2F39.4080504@gmail.com> <20130804221454.GB7707@kamineko.org> <51FEF199.7050800@gmail.com> <20130808221742.GA27435@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f43.google.com ([209.85.214.43]:58007 "EHLO
	mail-bk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567Ab3IUVg3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 Sep 2013 17:36:29 -0400
Received: by mail-bk0-f43.google.com with SMTP id mz13so239712bkb.30
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Sep 2013 14:36:28 -0700 (PDT)
In-Reply-To: <20130808221742.GA27435@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

Hi Mattia,

you are right!
If I comment out either one case  (0x0143/0x014b) no crash occurs. I 
also recognized that the gfx switch value is wrong. Using the gfx switch 
toggles the value, but it is the opposite to the actual switch position. 
What can I do to help you solving this bug?
