From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] module 'dell-laptop': quirk for laptop Dell Inspiron
 3179: problem with keyboard controller for keys: Home, End, PgUp, PgDn
Date: Sat, 7 Jan 2017 21:16:50 +0000
Message-ID: <20170107211650.GA5883@srcf.ucam.org>
References: <20170107205240.11836-1-polymorphm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54901 "EHLO
        cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750770AbdAGVuP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Jan 2017 16:50:15 -0500
Content-Disposition: inline
In-Reply-To: <20170107205240.11836-1-polymorphm@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Antonov <polymorphm@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, =?utf-8?B?0LzQsNGB0YLQtdGAINC40L3RgdGC0YDRg9C60YbQuNC4INC+INGC0L7QvCA=?= =?utf-8?B?0LrQsNC6INC+0YLRgdGL0LvQsNGC0Ywg0L/QsNGC0YfQuCDQsiDRj9C00YA=?= =?utf-8?B?0L4gKNC10YHQu9C4INGH0YLQviDRgtC+INCy0LjQvdC40Lwg0LLQviDQstGB?= =?utf-8?B?0ZHQvCDRjdGC0L7Qs9C+INC/0LDRgNC90Y8p?= <i.gnatenko.brain@gmail.com>

I think you should be able to do this by simply adding some entries to 
hwdb.d/60-keyboard.hwdb - if you set the scancodes to !, udev should 
then tell the kernel to synthesise keyup events.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
