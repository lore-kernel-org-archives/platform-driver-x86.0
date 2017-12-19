From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Tue, 19 Dec 2017 17:23:42 +0100
Message-ID: <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

>>   Delete an error message for a failed memory allocation in three functions
> 
> This one is questionable since it prints error messages at ->init() stage.
> I would rather not touch this.

Do you find the Linux allocation failure report insufficient in this case?


>>   Improve a size determination in tpacpi_new_rfkill()
> 
> Doesn't make any sense right now. One style over the other.
> Nothing gets better or worth at this point.

Would you like to care for a bit more compliance with information
from the section “14) Allocating memory” in the document “coding-style.rst”?

Regards,
Markus
