From: Laszlo Toth <laszlth@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: merge fill_request and
 send_request
Date: Sat, 17 Feb 2018 22:45:43 +0100
Message-ID: <20180217214543.GA3215@laszlth>
References: <20180213211617.GA7117@laszlth>
 <20180213213214.GA7419@laszlth>
 <20180213221742.q4m5tzsaxvouzw7l@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33432 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751209AbeBQVpq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Feb 2018 16:45:46 -0500
Received: by mail-wr0-f194.google.com with SMTP id s5so6113009wra.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Feb 2018 13:45:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180213221742.q4m5tzsaxvouzw7l@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Laszlo Toth <laszlth@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org

On Tue, Feb 13, 2018 at 11:17:42PM +0100, Pali Rohár wrote:
> Hi! This would be ratter longer email, but I hope I write everything
> needed.
> 
Hi! Sorry for the late reply.
> On Tuesday 13 February 2018 22:32:14 Laszlo Toth wrote:
> > Answer to Pali from the prev. thread (before splitting):
> > 
> > "Hi!
> > I agree, there are a lot of 0s just to overwrite a 0 with 0
> > after memset.
> > So filling the buffer args could be improved regardless of my patch,
> > after that the merged function wouldn't have so many.
> > But for now I just changed them to one call. This way it won't have
> > to pass buffer ptr twice to 2 functions "chained" together and
> > already full of params to send a request.
> 
> Main problem is that I still do not see a big benefit of it.
> 
> Or to say it in opposite way, why it is worse to have two functions and
> need to pass buffer pointer to both functions (for obvious reason) as a
> first parameter?
> 

I think it's easier to overlook some values like the 0x1 -> 0 case after
&buffer. Not a big benefit though, I agree.

> > There is one called and job done.
> 
> Apparently job is not done. There are also output parameters filled by
> SMM (remote side) which caller wants to inspect. Job is: prepare,
> fill, execute, fetch and process (check output/result).
> 

I meant job as sending. Point was that currently sending is a fill + send,
so it's two functions for one thing to do.

> > You're right in general, but this one is kinda special:
> > it does what you want _and_ holds the values you need to do that, too.
> > So this isn't a heavily used and modified function call I think, more
> > like a define without an actual define.
> > 
> > With these in mind I think it's better like this, you just check the
> > last line and done. That's how I found the typo in the other commit
> > as after &buffer it was invisible. I thought it might help."
> 
> If you are going to write a new call or modify existing (for any reason)
> you need to look at every one argument in that function. And if you want
> to understand what is that function doing (again for any reason,
> including "verification that code is written correctly"), you need to map
> each positional argument to its meaning.
> 

I don't see the problem here. It's separated to multiple lines, we can
check them easily when writing new ones. Moreover you have to do this
now as well I think.

> And I think generally functions with lot of parameters are reading
> harder then function with few (3-4 arguments).
> 

Agreed.

> We can also open another question, why your proposed function takes
> buffer structure which has members for input arguments, but also takes
> input arguments as function parameters? Seems a bit illogical and
> probably can confuse some people.
> 
> 

Good point.

> Just another look at it:
> 
> Buffer consists of 3 parts:
> 
> 1) input parameters
> 2) output parameters
> 3) type of the SMM call (selector/class or how it is called in Dell terminology)
> 
> For sending current buffer to SMM there is a one function for it. And
> part of it you specify also type of the SMM call.
> 
> Another (helper) function was created to fill input parameters into
> buffer, so user would not need to manually clear buffer (via memset) and
> then assign needed parameters.
> 
> And until now there was no need to create (helper) function to do
> something with output parameters. If somebody needs them, just access
> it.
> 
> I think this is just classic decomposition for solving some problem into
> smaller pieces (fill input parameters, send request).
> 
> It can be compared to problem "write buffer to file". You have name of
> file, access mode for file, permissions (in case to create new file),
> buffer which you want to write and size of buffer. But you do not have
> one function which do everything and takes lot of parameters. Rather you
> have a function to create or open file and function to send data to
> opened file. For each logic one function.
> 
> 
> 
> And another point of view:
> 
> Looking at code
> 
>   dell_send_request(&buffer, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
> 
> I can deduce just from function names and parameters that it sends some
> buffer to keyboard backlight service. Without reading implementation of
> that function.
> 
> After your change there is a code
> 
>   dell_send_request(&buffer, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT, 0, 0, 0, 0);
> 
> I can just deduce it does something with buffer, probably send it into
> keyboard backlight service, but I have absolutely no idea what are there
> doing four zeros and why there are needed.
> 
> To make it more readable I need to do something like this:
> 
>   #define ARGUMENT_1_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0
>   #define ARGUMENT_2_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0
>   #define ARGUMENT_3_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0
>   #define ARGUMENT_4_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0
> 
>   dell_send_request(
>     &buffer,
>     CLASS_KBD_BACKLIGHT,
>     SELECT_KBD_BACKLIGHT,
>     ARGUMENT_1_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION,
>     ARGUMENT_2_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION,
>     ARGUMENT_3_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION,
>     ARGUMENT_4_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION
>   );
> 
> Then I can deduce from code that it send request for asking feature
> information about keyboard backlight. And also I know what are
> arguments, what is definition of SMM request.
> 
> But it is too verbose, long and unusual.
> 
> If I want to prevent writing such verbose code, I can logically split
> one function call into more. And one logic part of this are input
> arguments.
> 

You're right, mine won't be better. The two functions look like
the less bad thing now. Please ignore the patch.

Maybe I'll take another look at it if I have some spare time.

Thanks for the detailed reply,
Laszlo

> -- 
> Pali Rohár
> pali.rohar@gmail.com
