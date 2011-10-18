From: John Hughes <john@Calva.COM>
Subject: Re: sony-laptop driver: Volume keys on Sony Vaio TX3 don't work
Date: Tue, 18 Oct 2011 11:02:35 +0200
Message-ID: <4E9D40AB.2060009@Calva.COM>
References: <4E9ABBF6.3000504@calvaedi.com> <4E9ADBD3.4070404@calvaedi.com> <4E9B182A.3020101@calvaedi.com> <74494.1318789218@turing-police.cc.vt.edu> <20111016213800.GA12703@kamineko.org> <81436.1318801813@turing-police.cc.vt.edu> <4E9B65EC.7020303@calvaedi.com> <20111017214326.GA1311@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111017214326.GA1311@kamineko.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattia Dongili <malattia@linux.it>
Cc: Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, Stelian Pop <stelian@popies.net>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 17/10/11 23:43, Mattia Dongili wrote:
> On Mon, Oct 17, 2011 at 01:17:00AM +0200, John Hughes wrote:
>    
>> Ok, what is "two phase hotkey decoding?"
>>      
> basically the driver receives in IRQ, reads from the IO port a value
> that turns out to be a generic value that means "got a hotkey" and needs
> to write one more command to the IO port and wait for another IRQ that
> potentially has the information about what hotkey was pressed.
>
> The part we're currently missing is what to write to the IO port for
> some models.
>
> See type3_handle_irq in the source and type3_events: most of those with
> data=0x05 require extra handling that we are not doing.
> On the second IRQ you get some data=0x31 and the actual event.
>
>    
Oh, I see.

Poking around in the dark.  What fun.

I'll see if I can think of any useful experiments.
